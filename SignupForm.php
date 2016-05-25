<?php
namespace frontend\models;

use common\models\User;
use frontend\models\Profiles;
use yii\base\Model;
use Yii;

/**
 * Signup form
 */
class SignupForm extends Model
{
    public $username;
    public $email;
    public $password;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['username', 'filter', 'filter' => 'trim'],
            ['username', 'required', 'message' => 'Поле Ваше имя не должно быть пустым'],
            ['username', 'string', 'min' => 2, 'max' => 255, 'message' => 'Поле Имя содержит неправильное количество символов'],

            ['email', 'filter', 'filter' => 'trim'],
            ['email', 'required', 'message' => 'Поле Email не должно быть пустым'],
            ['email', 'email', 'message' => 'Поле Email некорректно введено'],
            ['email', 'string', 'max' => 255],
            ['email', 'unique', 'targetClass' => '\common\models\User', 'message' => 'Такой email уже зарегестрирован'],

            ['password', 'required', 'message' => 'Поле Пароль не должно быть пустым'],
            ['password', 'string', 'message' => 'Длинна пароля должна быть не меньше 8-ми символов', 'min' => 8],
        ];
    }

    /**
     * Signs user up.
     *
     * @return User|null the saved model or null if saving fails
     */
    public function signup()
    {
        if (!$this->validate()) {
            return null;
        }
        $user = new User();
        $user->username = $this->username;
        $user->email = $this->email;
        $user->setPassword($this->password);
        $user->generateAuthKey();
        
        return $user->save() ? $user : null;
    }

    /**
    Регистрация пользователя
    */
    public function regUser($request)
    {
      // $model_reg = new SignupForm();
      for ($i=0; $i < count($request) ; $i++) { 
        $attributes[$request[$i]['name']] = $request[$i]['value'];
      }
      $this->username = $attributes['userName'];
      $this->email = $attributes['userEmail'];
      $this->password = $attributes['userPas'];
      if ($user = $this->signup()) {
        Yii::$app->getUser()->login($user);
        $profile = new Profiles();
        $profile->user_id = Yii::$app->user->id;
        $profile->first_name = $attributes['userName'];
        $profile->file_name = $attributes['prof_foto'];
        $profile->number_phone = $attributes['userTel'];
        $profile->number_phone2 = $attributes['userTelTwo'];
        $profile->created_at = date('d.m.Y');
        // if(isset($info['gplus']))$aUser->gplus=$info['gplus'];
        // if(isset($info['facebook']))$aUser->facebook=$info['facebook'];
        $profile->save();
        return array('status'=>'success');
      }
      return false;
    }

}
