class ApplicationController < ActionController::Base
#アプリケーションコントローラーは全てのコントローラーに対する処理を行える権限を持つ
#下記は「name」をデータとして保存を許可する機能
  before_action :configure_permitted_parameters, if: :devise_controller?
  #上記はdevise利用の機能(ユーザ登録、ログイン認証など)が使われる前にconfigure_permitted_parametersメソッドが実行される。
  
  def after_sign_in_path_for(resouce)
    about_path
  end
  #after_sign_in_path_for(deviseの初期設定ではroot_pathとなっている。)はdeviseが用意しているメソッドで、サインイン後にどこに遷移するかを設定しているメソッド。
  #resouceとう引数は、ログインを実行したモデルのデータ、つまりログインしたユーザのインスタンスが格納される。
  #ログイン後に魔EA時などのログインしたユーザーに関連するようなページ遷移を実装したい場合はresourceを活用して実装する。
  
  def after_sign_out_path_for(resource)
    about_path
  end
  #上記はサインアウト後の遷移先を示す。
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  #上記はconfigure_permitted_parametersメソッドでは、devise_parameter_sanitizer.permitメソッドを使うことで
  #ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可している。
end
