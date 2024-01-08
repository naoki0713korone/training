package bean;

public class HealthCheckLogic {
	
	public void execute(UserBean ub) {
		//BMIを算出して設定
		double weight = ub.getWeight();
		double height = ub.getHeight();
		double BMI = weight / (height / 100.0 * height / 100.0);
		double bmi = Math.round(BMI * 10.0) / 10.0;	
		//上記はメソッドはBMIに数値を掛けた後に四捨五入を行う。
		
		ub.setBmi(bmi);
		
		//BMI指数から体形を判定して設定
		String bodyType;
		if (bmi < 18.5) {
			bodyType = "やせ型";
		} else if (bmi < 25) {
			bodyType = "普通";
		} else {
			bodyType = "肥満";
		}
		ub.setBodyType(bodyType);
		}
	}

