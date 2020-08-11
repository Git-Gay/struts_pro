package action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.swing.Action;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.FoodDao;
import model.DetailFood;
import model.Food;
import model.Shop;

public class FoodAction extends ActionSupport{
	Food food;
	Shop shop;
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	DetailFood dFood;
	private File doc;
	private String docFileName;
    private String docContentType;
    private String address;
	public File getDoc() {
		return doc;
	}
	public void setDoc(File doc) {
		this.doc = doc;
	}
	public String getDocFileName() {
		return docFileName;
	}
	public void setDocFileName(String docFileName) {
		this.docFileName = docFileName;
	}
	public String getDocContentType() {
		return docContentType;
	}
	public void setDocContentType(String docContentType) {
		this.docContentType = docContentType;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public DetailFood getdFood() {
		return dFood;
	}
	public void setdFood(DetailFood dFood) {
		this.dFood = dFood;
	}
	public Food getFood() {
		return food;
	}
	public void setFood(Food food) {
		this.food = food;
	}
	ArrayList<Food> foodlist;
	public ArrayList<Food> getFoodlist() {
		return foodlist;
	}
	public void setFoodlist(ArrayList<Food> foodlist) {
		this.foodlist = foodlist;
	}
	
	//菜的分类查询
	public String query() {
		FoodDao dao = new FoodDao();
		foodlist = dao.query(food.getType());
		return "query";
	}
	
	//菜的详情查询
	public String queryAll() {
		FoodDao dao = new FoodDao();
		String id = ServletActionContext.getRequest().getParameter("id");
		dFood = dao.queryAll(id);
		Map<String,Object> session = ActionContext.getContext().getSession();
		session.put("dfood", dFood);
		return "queryAll";
	}
	
	//加入购物车
	public String addShop() {
		FoodDao dao = new FoodDao();
		boolean flag = dao.addShop(shop);
		if(flag) {
			queryShop();
			return "addshop";
		}else {
			return "addfail";
		}
	}
	//购物车查询
	public String queryShop() {
		FoodDao dao = new FoodDao();
		ArrayList<Shop> list = dao.queryShop();
		System.out.println(list.get(0));
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("shopcart", list);
		return "qushop";
	}
	
	//搜索框查询
	public String search() {
		FoodDao dao = new FoodDao();
		foodlist = dao.search(food.getDishName());
		/*System.out.println(food.getDishName());*/
		return "query";
	}
	
	//菜的上架
	public String addFood() throws IOException {
		String contextPath = ServletActionContext.getServletContext().getRealPath("/img");
	    File destFile = new File(contextPath, docFileName);
	    String destFilePath = destFile.getPath();
	    String realPath = ServletActionContext.getServletContext().getRealPath("/img");
	    address = destFilePath.substring(realPath.length());
	    FileUtils.copyFile(doc, destFile);
		FoodDao dao = new FoodDao();
		boolean flag = dao.addFood(food,address);
		if(flag) {
			return "addsuccess";
		}else {
			return "addfail";
		}	
	}
	
	//所有菜查询
	public String allFood() {
		FoodDao dao = new FoodDao();
		foodlist = dao.allFood();
		return "allfood";
	}
	
	//菜品下架
	public String delFood() {
		FoodDao dao = new FoodDao();
		boolean flag = dao.delFood(food.getDishName());
		if(flag) {
			allFood();
			return "delok";
		}else {
			return "delfail";
		}
	}
}
