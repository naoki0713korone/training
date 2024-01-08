package bean;

import java.io.Serializable;

public class TrainingBean implements Serializable {

	//Training Tabelの情報を書き込んでいる
	private String chestpressweight;
	private String chestpresscount;
	private String latpulldownweight;
	private String latpulldowncount;
	private String bicepscurlweight;
	private String bicepscurlcount;
	private String shoulderpressweight;
	private String shoulderpresscount;
	private String abdominalweight;
	private String abdominalcount;
	private String legpressweight;
	private String legpresscount;
	private String date;
	private String id;

	//setter.getterの用意
	public String getChestpressweight() {
		return chestpressweight;
	}

	public void setChestpressweight(String chestpressweight) {
		this.chestpressweight = chestpressweight;
	}

	public String getChestpresscount() {
		return chestpresscount;
	}

	public void setChestpresscount(String chestpresscount) {
		this.chestpresscount = chestpresscount;
	}

	public String getLatpulldownweight() {
		return latpulldownweight;
	}

	public void setLatpulldownweight(String latpulldownweight) {
		this.latpulldownweight = latpulldownweight;
	}

	public String getLatpulldowncount() {
		return latpulldowncount;
	}

	public void setLatpulldowncount(String latpulldowncount) {
		this.latpulldowncount = latpulldowncount;
	}

	public String getBicepscurlweight() {
		return bicepscurlweight;
	}

	public void setBicepscurlweight(String bicepscurlweight) {
		this.bicepscurlweight = bicepscurlweight;
	}

	public String getBicepscurlcount() {
		return bicepscurlcount;
	}

	public void setBicepscurlcount(String bicepscurlcount) {
		this.bicepscurlcount = bicepscurlcount;
	}

	public String getShoulderpressweight() {
		return shoulderpressweight;
	}

	public void setShoulderpressweight(String shoulderpressweight) {
		this.shoulderpressweight = shoulderpressweight;
	}

	public String getShoulderpresscount() {
		return shoulderpresscount;
	}

	public void setShoulderpresscount(String shoulderpresscount) {
		this.shoulderpresscount = shoulderpresscount;
	}

	public String getAbdominalweight() {
		return abdominalweight;
	}

	public void setAbdominalweight(String abdominalweight) {
		this.abdominalweight = abdominalweight;
	}

	public String getAbdominalcount() {
		return abdominalcount;
	}

	public void setAbdominalcount(String abdominalcount) {
		this.abdominalcount = abdominalcount;
	}

	public String getLegpressweight() {
		return legpressweight;
	}

	public void setLegpressweight(String legpressweight) {
		this.legpressweight = legpressweight;
	}

	public String getLegpresscount() {
		return legpresscount;
	}

	public void setLegpresscount(String legpresscount) {
		this.legpresscount = legpresscount;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
