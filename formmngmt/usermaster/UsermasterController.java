package com.efive.formmngmt.usermaster;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.efive.formmngmt.formspage.CreateExcel;
import com.efive.formmngmt.session.HibernateSessionFacConfig;

@Controller
public class UsermasterController {
	@Autowired
	private UsermasterService userservice;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	HibernateSessionFacConfig hsessionFactory;

	@Autowired
	EntityManagerFactory entitymanagerfactory;

	@GetMapping("/user")
	public String page(Model model) {

		HttpSession session5 = request.getSession();

		if (session5.getAttribute("status").equals("success")) {

			String email = (String) session5.getAttribute("emailid");
			Transaction transaction1 = null;
			List<?> taskbardata = null;
			System.err.println(email);
			Session session1 = hsessionFactory.getCurrentSession();

			transaction1 = session1.beginTransaction();
			taskbardata = session1
					.createNativeQuery(
							"SELECT first_name, email, image FROM user_master where email = '" + email + "';")
					.getResultList();
			System.err.println(taskbardata);

			transaction1.commit();
			model.addAttribute("headerdata", taskbardata);
			session1.close();
		}
		
		// model.addAttribute("users", userservice.getAllUser());
		return "user_master";
	}

	@PostMapping("/checkemail")
	@ResponseBody
	public String validemail(@RequestBody String eml) {
		String finalll = eml;
		String temp = finalll.replaceAll("%40", "@");
		String str = temp.replaceAll("=", "");

		System.err.println(str);
		String flag = "true";
//		System.err.println(userservice.getAllemail());

		List<String> emails = new ArrayList<>();

		emails = userservice.getAllemail();
		System.err.println(emails);

		if (emails.contains(str)) {
			System.err.println("contains");
			flag = "true";
		} else {
			System.err.println("not");

			flag = "false";
		}
		return flag;
	}

	@PostMapping("/useradd")
	public String saveuser(@RequestPart(value = "usrobj") UsermasterEntity usermasterEntity,
			@RequestPart(value = "image", required = false) MultipartFile mpf) throws IOException {

		int userid = usermasterEntity.getId();

		if (userid == 0) {
			byte bytes[] = mpf.getBytes();

			String rootpath = System.getProperty("user.dir");

			String dirpth = rootpath + File.separator + "src" + File.separator + "main" + File.separator + "resources"
					+ File.separator + "static" + File.separator + "img" + File.separator;

			File dir = new File(dirpth);
			if (!dir.exists()) {
				dir.mkdirs();
			}

			String filename = mpf.getOriginalFilename();

			String filepath = dirpth + filename;

			System.err.println(filepath);
			File fp = new File(filepath);
			if (fp.exists()) {
				fp.delete();
			}
			Path path = Paths.get(filepath);
			Files.write(path, bytes);

			String pathdb = filepath.substring(83);

			usermasterEntity.setimage(pathdb);
			userservice.saveUser(usermasterEntity);
			System.err.println("add");
		} else {
			UsermasterEntity usermaster = userservice.getUserById(userid);
			usermaster.setFirst_name(usermasterEntity.getFirst_name());
			usermaster.setLast_name(usermasterEntity.getLast_name());
			usermaster.setEmail(usermasterEntity.getEmail());
			usermaster.setGender(usermasterEntity.getGender());
			usermaster.setPhone(usermasterEntity.getPhone());
			usermaster.setValFro(usermasterEntity.getValFro());
			usermaster.setValTo(usermasterEntity.getValTo());
			usermaster.setRoles(usermasterEntity.getRoles());

			System.err.println(mpf);
			if (mpf != null) {
				byte bytes[] = mpf.getBytes();

				String rootpath = System.getProperty("user.dir");

				String dirpth = rootpath + File.separator + "src" + File.separator + "main" + File.separator
						+ "resources" + File.separator + "static" + File.separator + "img" + File.separator;

				File dir = new File(dirpth);
				if (!dir.exists()) {
					dir.mkdirs();
				}

				String filename = mpf.getOriginalFilename();

				String filepath = dirpth + filename;

				System.err.println(filepath);
				File fp = new File(filepath);
				if (fp.exists()) {
					fp.delete();
				}
				Path path = Paths.get(filepath);
				Files.write(path, bytes);

				String pathdb = filepath.substring(83);

				usermaster.setimage(pathdb);
			} else {
				System.err.println(mpf);
				usermaster.setimage(usermasterEntity.getimage());
				System.err.println("here");
			}

			userservice.saveUser(usermaster);

		}
		return "user_master";
	}

	@GetMapping("/edit/{id}")
	public ResponseEntity<?> edituser(@PathVariable Integer id, Model model) {
		UsermasterEntity user = userservice.getUserById(id);
		return new ResponseEntity<>(user, HttpStatus.OK);
	}

	@GetMapping("/delete/{id}")
	public ResponseEntity<?> deleteuser(@PathVariable Integer id) {
		userservice.deleteUserById(id);

		return new ResponseEntity<>(HttpStatus.OK);
	}

	@GetMapping("/userexcel")
	public void createexcel(HttpServletResponse response) throws IOException {
		response.setContentType("application/octet-stream");

		String name = request.getParameter("name");
		String role = request.getParameter("role");
		System.err.println(name);
		System.err.println(role);

		EntityManager manager = null;

		manager = entitymanagerfactory.createEntityManager();

		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=User_master.xlsx";

		response.setHeader(headerKey, headerValue);

		List<Map<String, Object>> excelfinaldata = new ArrayList<Map<String, Object>>();

		String[] arrayofheader = new String[8];
		arrayofheader[0] = "Email";
		arrayofheader[1] = "First_name";
		arrayofheader[2] = "Last_name";
		arrayofheader[3] = "Gender";
		arrayofheader[4] = "PhoneNo";
		arrayofheader[5] = "Valid_from";
		arrayofheader[6] = "Valid_to";
		arrayofheader[7] = "Image";

		// For headers
		List<?> arrayh = null;
		if (name.equals("") && role.equals("0")) {

			String str = "SELECT email, first_name, last_name, gender, phone_no_, valid_from, valid_to, image FROM user_master;";
			Query query = manager.createNativeQuery(str);
			arrayh = query.getResultList();
		}
		else if(name.equals("") && !(role.equals("0")))
		{
			String str = "SELECT email, first_name, last_name, gender, phone_no_, valid_from, valid_to, image FROM user_master where role = '"+role+"';";
			Query query = manager.createNativeQuery(str);
			arrayh = query.getResultList();
		}
		else if(!(name.equals("")) && role.equals("0"))
		{
			String str = "SELECT email, first_name, last_name, gender, phone_no_, valid_from, valid_to, image FROM user_master where first_name = '"+name+"';";
			Query query = manager.createNativeQuery(str);
			arrayh = query.getResultList();
		}
		else if(!(name.equals("")) && !(role.equals("0")))
		{
			String str = "SELECT email, first_name, last_name, gender, phone_no_, valid_from, valid_to, image FROM user_master where role = '"+role+"' and first_name = '"+name+"';";
			Query query = manager.createNativeQuery(str);
			arrayh = query.getResultList();
		}

		for (Iterator iterator = arrayh.iterator(); iterator.hasNext();) {
			Object object = (Object) iterator.next();

			Map<String, Object> row = new HashMap<>();
			row.put("Email", ((Object[]) object)[0]);
			row.put("First_name", ((Object[]) object)[1]);
			row.put("Last_name", ((Object[]) object)[2]);
			row.put("Gender", ((Object[]) object)[3]);
			row.put("PhoneNo", ((Object[]) object)[4]);
			row.put("Valid_from", ((Object[]) object)[5]);
			row.put("Valid_to", ((Object[]) object)[6]);
			row.put("Image", ((Object[]) object)[7]);

			excelfinaldata.add(row);
		}

		UserMasterExcel createexcel = new UserMasterExcel(arrayofheader, excelfinaldata);

		createexcel.export(response);
	}

	@GetMapping("/searchbtnclk/{name}/{role}")
	public ResponseEntity<?> seachbtnclick(@PathVariable String name, @PathVariable Integer role) {
		System.err.println(name);
		System.err.println(role);
		List<UsermasterEntity> userdatatbl = null;
		if(name.equals("0") && role == 0)
		{
			userdatatbl =  userservice.getAllUser();
		}
		else if(name.equals("0") && !(role == 0))
		{
			userdatatbl =  userservice.getdataonsearch1(role);
		}
		else if(!(name.equals("0")) && role == 0)
		{
			userdatatbl =  userservice.getdataonsearch2(name);
		}
		else if(!(name.equals("0")) && !(role == 0))
		{
			userdatatbl =  userservice.getdataonsearch(name, role);
		}

		return new ResponseEntity<>(userdatatbl, HttpStatus.OK);
	}

	@GetMapping("/getdatatable")
	public ResponseEntity<?> gettingalldata() {
		List<UsermasterEntity> userss = userservice.getAllUser();
		return new ResponseEntity<>(userss, HttpStatus.OK);
	}

}
