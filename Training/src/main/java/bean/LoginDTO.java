package bean;

import java.io.Serializable;
import java.util.ArrayList;

public class LoginDTO implements Serializable {		//Serializable オブジェクトの直列化
	public ArrayList<UserBean> list;	//UserBeanという値を格納するコレクション

	public LoginDTO() {
		list = new ArrayList<UserBean>();	
	}

	public void add(UserBean ub) {	//リスト変数にubを追加している
		list.add(ub);
	}

	public UserBean get(int i) {	//取り出しの際に使用
		return list.get(i);
	}

	public int size() {
		return list.size();	//要素数の取得
	}

}
