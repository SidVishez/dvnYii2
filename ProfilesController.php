<?php

namespace frontend\controllers;

use Yii;
use frontend\models\Profiles;
use frontend\models\ProfilesSearch;
use frontend\models\Objects;
use frontend\models\FavouriteObjects;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * ProfilesController implements the CRUD actions for Profiles model.
 */
class ProfilesController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all Profiles models.
     * @return mixed
     */
    public function actionIndex()
    {
        if(Yii::$app->user->isGuest)
           return $this->goHome();
        $profile = new Profiles();
        $objects = Objects::find()->where(['users_user_id'=> Yii::$app->user->id])->all();
        $favourite_objects = FavouriteObjects::find()->where(['users_id'=> Yii::$app->user->id, 'status'=>1])->all();
        $request = Yii::$app->request->post('status');
        $ob_id = Yii::$app->request->post('ob_id');
        $fav_ob = Yii::$app->request->post('del_fav_obj');
        //избранное
        for ($i=0; $i < count($favourite_objects); $i++) { 
            $favourite_objects[$i] = Objects::find()->where(['id'=> $favourite_objects[$i]['objects_id']])->all();
        }
        if(isset($fav_ob))
        {  
            $favor = FavouriteObjects::find()->where(['objects_id'=> $fav_ob, 'users_id'=> Yii::$app->user->id])->one();
            $favor->status = 0;
            $favor->update();
            return \yii\helpers\Json::encode('Убрано из избранного');
        } 
        // активация/деактивация объекта
        if(isset($request))
        {
            $object = Objects::findOne($ob_id);
            $object->rented = $request;
            if(!$object->validate()){
                return \yii\helpers\Json::encode($object->errors);
            }
            $object->update();
            return \yii\helpers\Json::encode($object); 
        }

        $prof_info = $profile->editProfile();
        if(!empty($prof_info)) return $this->refresh(); 

        return $this->render('index', [
            'objects' => $objects,
            'favourite_objects' => $favourite_objects,
            'profile' => $profile->getPersonalData(),
        ]);
    }

    /**
     * Displays a single Profiles model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Profiles model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Profiles();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->user_id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Profiles model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->user_id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Profiles model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Profiles model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Profiles the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Profiles::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
