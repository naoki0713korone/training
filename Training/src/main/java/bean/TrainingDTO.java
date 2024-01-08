package bean;

import java.io.Serializable;
import java.util.ArrayList;

public class TrainingDTO implements Serializable {
	private ArrayList<TrainingBean> list; //listの中にテーブル情報を格納
											//　ＤＢ１件分の情報をオブジェクトとして扱う

	public TrainingDTO() {
		list = new ArrayList<TrainingBean>(); //ArrayListを新規で作成する引数なしのコンストラクタ
	}

	public void add(TrainingBean tb) { //オブジェクトをArrayListに追加するaddメソッド
		list.add(tb);
	}

	public TrainingBean get(int i) { //ArrayListの中から取り出すgetメソッド
		return list.get(i);
	}

	public int size() {
		return list.size(); //ArrayListのサイズを取得するsize()メソッド
	}
}

//このオブジェクトをDAOのselect()メソッドに返す