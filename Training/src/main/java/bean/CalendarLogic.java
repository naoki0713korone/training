
package bean;

import java.util.Calendar;

public class CalendarLogic {
	
	//カレンダーインスタンスを生成するメソッド(int...は可変長引数)
	public CalendarBean createMyCalendar(int... args) { //引数２パターンあるので可変長引数の形にしている
		
		//マイカレンダーインスタンス生成
		CalendarBean cb = new CalendarBean();
		
	
		//Calendarクラスは抽象クラスのためnewではなく,getInstanceメソッドを使用
		//呼び出すごとに現在の日付と時間に初期化された状態で、オブジェクトを返す。
		Calendar cal = Calendar.getInstance();
		
		//２つの引数が来ていたら
		if (args.length == 2) {
			
			//最初の引数で年を設定
			cal.set(Calendar.YEAR, args[0]);
			
			//次の引数で月を設定
			//Calendar.MONTHは0から始まる。日本は１月、２月と数えるが海外はJan,Feb, 0始まりの方が配列で扱いやすい
			cal.set(Calendar.MONTH, args[1] - 1);
		}
		
		
		
		
		
		
		//カレンダービーンに年を設定,カレンダークラスのgetメソッドを使い、年の値を取得する。
		//cal.get(Calendar.YEAR)でカレンダーインスタンスのyearの値を参照
		cb.setYear(cal.get(Calendar.YEAR));
		
		
		//設定された年の値を基に、cbの元号を設定
		if (cb.getYear() > 2018) {
			cb.setGengou("令和" + (cb.getYear() - 2018));
		} else if (cb.getYear() > 1988) {
			cb.setGengou("平成" + (cb.getYear() - 1988));
		} else if (cb.getYear() > 1925) {
			cb.setGengou("昭和" + (cb.getYear() - 1925));
		} else if (cb.getYear() > 1911) {
			cb.setGengou("大正" + (cb.getYear() - 1911));
		} else {
			cb.setGengou("" + cb.getYear());
		}
		
		
		
		
		//Calendarクラスは月またぎの問題があり、0が1月となる
		//カレンダービーンに月の設定
		cb.setMonth(cal.get(Calendar.MONTH) + 1);
		
		
		
		
		
		//その月の1日が何曜日かを調べる為に日付を1日に上書きする
		cal.set(Calendar.DATE, 1);
		
		
		
		//カレンダーの最初の空白の数。Calendar.DAY_OF_WEEKは週の何日目かを表す
		//Calendar.DAY_OF_WEEKは１～７の定数なので、空白の数に合わせるため-1している
		int before = cal.get(Calendar.DAY_OF_WEEK) - 1;
		
		
		//カレンダーの日付の数
		//cal.getActualMaximumは、JavaのCalendarクラスのメソッドの一つ。特定のカレンダーフィールドの最大値を取得するために使用されます。
		int daysCount = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		
		
		//その月の最後の日(dayscount)が何曜日かを調べるために日付を最終日にする
		cal.set(Calendar.DATE, daysCount);
		
		//最後の日の後の空白の数
		int after = 7 - cal.get(Calendar.DAY_OF_WEEK);
		
		
		
		//すべての要素数。カレンダーの総マス目
		int total = before + daysCount + after;
		
		//その要素数を幅7個の配列に入れていった場合何行必要か
		int rows = total / 7;
		
		
		
		//その行数で2次元配列を生成。dataに日付か空文字を入れていく
		String[][] data = new String[rows][7];
		
		
		
		//今見ているカレンダーが今月かどうかを調べるために、この瞬間の日付情報をもつもう一つのインスタンス作成しておく
		Calendar now = Calendar.getInstance();
		
		
		for (int i = 0; i < rows; i++) {  // [0][0],[0][1],.....[0][6],[1][0]......[5][7]まで繰り返す二重ループ
			
			for (int j = 0; j < 7; j++) {
				if (i == 0 && j < before || i == rows - 1 && j >= (7 - after)) { 
					//0行目かつ列が前の空白の数より小さいとき、最終行かつ列が後ろの空白数より大きいとき
					//カレンダーの前後に入る空白の部分は空文字に設定する
					
					data[i][j] = "";
				} else {
					//カウンター変数と実際の日付の変換。実際の日付をdateに格納
					int date = i * 7 + j + 1 - before;
					
					//配列に日付を入れる。dataには前後の空文字と日付が入る
					//dateがint型なので、Stringに変換
					data[i][j] = String.valueOf(date);
					
					
					//今作業しているマイカレンダーが今月のカレンダーだったら今日の日付の先頭に*を付与する
					//当日をカレンダー上で判別できるようにCSSで装飾するため
					if (now.get(Calendar.DATE) == date && now.get(Calendar.MONTH) == cb.getMonth() - 1
							&& now.get(Calendar.YEAR) == cb.getYear()) {
						data[i][j] = "*" + data[i][j];
					}
				}
			}
		}
		//作成した2次元配列をマイカレンダーにセットする。
		cb.setData(data);
		return cb;
	}
}