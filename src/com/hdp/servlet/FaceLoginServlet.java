package com.hdp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.hdp.dao.UserDao;
import com.hdp.dao.factory.DaoFactory;
import com.hdp.dao.pojo.User;
import com.hdp.util.FaceSpot;

/**
 * Servlet implementation class FaceLoginServlet
 */
public class FaceLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final BigDecimal VERIFY_OK_SCORE = new BigDecimal(90);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaceLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  response.setContentType("text/html;charset=UTF-8");
		  request.setCharacterEncoding("UTF-8");
		 response.setCharacterEncoding("UTF-8");
		  response.getHeader("textml; charset=UTF-8"); 
		  //实例化PrintWriter对象
		 PrintWriter out = response.getWriter(); 
		 String img = request.getParameter("img");
		 
		 JSONObject js = FaceSpot.searchFace(img, "face", null);
		 JSONObject result = js.getJSONObject("result");
		 JSONArray userList = result.getJSONArray("user_list");
		 for (int i = 0; i < userList.length(); i++) {
			 JSONObject json = userList.getJSONObject(i);
			 BigDecimal score = json.getBigDecimal("score");
			if (score.compareTo(VERIFY_OK_SCORE) > 0) {
				String userId = json.getString("user_id");
				String phone = json.getString("user_info");
				UserDao userDao = DaoFactory.getUserDao();
				User user = userDao.queryObject(userId);
				if (null == user) {
					user = new User();
					user.setUid(userId);
					user.setUname(phone);
					user.setUpassword("123456");
					user.setUrole(1);
					userDao.add(user);
				}
				
				HttpSession httpSession=request.getSession();
				httpSession.setAttribute("user", user);//设置过滤器
			}
		}
		 
		 out.print(js);
		 
	}

}
