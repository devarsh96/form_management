package com.efive.formmngmt.login;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.efive.formmngmt.session.HibernateSessionFacConfig;
import com.efive.formmngmt.usermaster.SendEmailonAdd;

@Controller
public class LoginController {

	@Autowired
	private EntityManagerFactory entitymanagerfactory;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	HibernateSessionFacConfig hsessionFactory;

	@GetMapping("/login")
	public String loginPage() {
		HttpSession session = request.getSession();
		session.invalidate();
		return "index";
	}

	public Map<String, Object> validataDTO(LoginEntity data) {
		Map<String, Object> status = new HashMap<>();
		try {
			EntityManager manager = null;
			manager = entitymanagerfactory.createEntityManager();
			if (data.getUsername().equals(null) || data.getUsername().equals("")) {
				status.put("status", "Fail");
				System.err.println("if");
			} else if (data.getPassword().equals(null) || data.getPassword().equals("")) {
				status.put("status", "Fail");
				System.err.println("in else if");
			} else {
				String query = "SELECT id,first_name,email,role FROM user_master WHERE email='" + data.getUsername()
						+ "' and password='" + data.getPassword() + "' ";
				System.out.println(query);
				Query qd = manager.createNativeQuery(query);
				Object ld = qd.getSingleResult();
				System.err.println(ld);
				Object[] ob = (Object[]) ld;
				System.err.println(ob);
				System.err.println(ob.length);
				System.err.println("-----------------------");
				if (ob[2].equals(data.getUsername())) {
					status.put("status", "success");

					status.put("userid", ob[0]);
					status.put("first_name", ob[1]);
					status.put("email", ob[2]);
					status.put("role", ob[3]);

				} else {
					status.put("status", "Fail");
				}

				System.err.println(status.get("status"));

				System.err.println(status.get("userid"));
				System.err.println(status.get("first_name"));
				System.err.println(status.get("email"));
				System.err.println(status.get("role"));

			}

		} catch (Exception e) {
			System.err.println("exception" + e.getMessage());
			status.put("status", e.getMessage());
		}
		return status;
	}

	@PostMapping("/logincheck")
	public ResponseEntity<Object> login(@RequestBody LoginEntity data) {

		System.err.println("this iss sata" + data);
		System.err.println(data.getPassword());
		System.err.println(data.getUsername());

		EntityManager manager = null;
		manager = entitymanagerfactory.createEntityManager();
		Map<String, Object> map = validataDTO(data);

		if (map.get("status").equals("success")) {
			System.err.println("IN MAP SUCCESS IF");
			HttpSession session = request.getSession();
			session.setAttribute("userid", map.get("userid"));
			session.setAttribute("username", map.get("first_name"));
			session.setAttribute("emailid", map.get("email"));
			session.setAttribute("role", map.get("role"));
			session.setAttribute("status", map.get("status"));

			String query = "SELECT first_name, email, last_name, phone_no_, role, image FROM user_master WHERE email='"
					+ data.getUsername() + "' and password='" + data.getPassword() + "' "; //
			System.out.println(query);

			Query qd = manager.createNativeQuery(query);
			Object ld = qd.getSingleResult();
			System.err.println(ld);
			Object[] ob = (Object[]) ld;
			String[] strarr = new String[6];
			
			for (int i = 0; i < ob.length; i++) {
				
				System.err.println(ob[i]);
				strarr[i] = ob[i].toString();
			}

			SendEmailonAdd.sendEmailmethod(strarr[0], strarr[1], strarr[2], strarr[3], strarr[5]);
		}

		return new ResponseEntity<>(map, HttpStatus.OK);
	}

}
