package com.efive.formmngmt.formspage;

import java.io.IOException;
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
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.efive.formmngmt.addeditform.FormEntity;
import com.efive.formmngmt.addeditform.FormService;
import com.efive.formmngmt.addeditform.OptionEntity;
import com.efive.formmngmt.addeditform.QuestionEntity;
import com.efive.formmngmt.addeditform.QuestionService;
import com.efive.formmngmt.addeditform.formDTO;
import com.efive.formmngmt.session.HibernateSessionFacConfig;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;

@Controller
public class FormsPageContoller {

	@Autowired
	HibernateSessionFacConfig hsessionFactory;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private FormPageService formpageservice;

	@Autowired
	private FormService formservice;

	@Autowired
	private EntityManagerFactory entitymanagerfactory;

	@GetMapping("/form")
	public String formPage(Model model) {
		System.err.println(formpageservice.getAllforms());

		model.addAttribute("formsadd", formpageservice.getAllforms());

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
		return "form";
	}

	@GetMapping("/add_edit_form")
	public String viewpage(Model model) {

		String formidji = request.getParameter("formidji");
		System.err.println(formidji);
		model.addAttribute("formidji", formidji);

		Transaction transaction = null;
		List<?> fillformdrop = null;

		Session session = hsessionFactory.getCurrentSession();

		transaction = session.beginTransaction();
		fillformdrop = session.createNativeQuery("SELECT * FROM module;").getResultList();

//		System.err.println("------------->" + fillformdrop);

		transaction.commit();
		model.addAttribute("modules", fillformdrop);

		Transaction transaction1 = null;
		List<?> fillformdrop1 = null;

		Session session1 = hsessionFactory.getCurrentSession();

		transaction1 = session1.beginTransaction();
		fillformdrop1 = session1.createNativeQuery("SELECT * FROM recurrance;").getResultList();

//		System.err.println("------------->" + fillformdrop1);

		transaction1.commit();
		model.addAttribute("recurrances", fillformdrop1);

		Transaction transaction2 = null;
		List<?> fillformdrop2 = null;

		Session session2 = hsessionFactory.getCurrentSession();

		transaction2 = session2.beginTransaction();
		fillformdrop2 = session2.createNativeQuery("SELECT * FROM month;").getResultList();

//		System.err.println("------------->" + fillformdrop2);

		transaction2.commit();
		model.addAttribute("months", fillformdrop2);

		return "add_edit_form";
	}

	@GetMapping("/formdata/{formid}")
	public ResponseEntity<Object> getFormdata(@PathVariable Integer formid) {
		System.err.println(formpageservice.getAllformdata(formid));
		FormEntity formdatas = formpageservice.getAllformdata(formid);
		return new ResponseEntity<Object>(formdatas, HttpStatus.OK);
	}

	@GetMapping("/quesdata/{formid}")
	public ResponseEntity<Object> getquesdata(@PathVariable Integer formid) {
		Transaction transaction4 = null;
		List<?> fillformdrop4 = null;

		Session session4 = hsessionFactory.getCurrentSession();

		transaction4 = session4.beginTransaction();
		fillformdrop4 = session4.createNativeQuery(
				"SELECT answertypeid, isansrequired, questiondesc, questionid, questionlabel, questionname, formid FROM question_master where formid = "
						+ formid + ";")
				.getResultList();
		transaction4.commit();
		System.err.println(fillformdrop4);

		return new ResponseEntity<Object>(fillformdrop4, HttpStatus.OK);
	}

	@GetMapping("/optdata/{formid}")
	public ResponseEntity<Object> getoptdata(@PathVariable Integer formid) {
		Transaction transaction5 = null;
		List<?> fillformdrop5 = null;

		Session session5 = hsessionFactory.getCurrentSession();

		transaction5 = session5.beginTransaction();
		fillformdrop5 = session5
				.createNativeQuery(
						"SELECT formid, options, questionid, oid FROM option_master where formid = " + formid + ";")
				.getResultList();
		transaction5.commit();
		System.err.println(fillformdrop5);

		return new ResponseEntity<Object>(fillformdrop5, HttpStatus.OK);
	}

	@GetMapping("/deleteformwhole/{frmid}")
	public String dltformdata(@PathVariable Integer frmid) {
		System.err.println("delete" + frmid);
		formservice.deletebyId(frmid);
		return "form";
	}

	@GetMapping("/previewform/{frmid}")
	public ResponseEntity<formDTO> prvformdata(@PathVariable Integer frmid) {
		formDTO frmdto = new formDTO();
		System.err.println("preview :" + frmid);
		FormEntity formdatas1 = formpageservice.getAllformdata(frmid);
		frmdto.setAddformentity(formdatas1);

		Transaction transaction5 = null;
		List<QuestionEntity> fillformdrop5 = null;

		Session session5 = hsessionFactory.getCurrentSession();

		transaction5 = session5.beginTransaction();
		fillformdrop5 = session5.createNativeQuery("SELECT * FROM question_master where formid = " + frmid + ";")
				.addEntity(QuestionEntity.class).getResultList();
		transaction5.commit();
		// System.err.println(fillformdrop5);
		frmdto.setAddquestionentity(fillformdrop5);

		Transaction transaction1 = null;
		List<OptionEntity> fillformdrop1 = null;

		Session session1 = hsessionFactory.getCurrentSession();

		transaction1 = session1.beginTransaction();
		fillformdrop1 = session1.createNativeQuery("SELECT * FROM option_master where formid = " + frmid + ";")
				.addEntity(OptionEntity.class).getResultList();
		transaction1.commit();
		// System.err.println(fillformdrop5);
		frmdto.setOptionentity(fillformdrop1);

		return new ResponseEntity<formDTO>(frmdto, HttpStatus.OK);
	}

	@GetMapping("/excelclick/{formid}")
	public void exceldatafun(HttpServletResponse response, @PathVariable Integer formid) throws IOException {
		response.setContentType("application/octet-stream");

		EntityManager manager = null;
		manager = entitymanagerfactory.createEntityManager();

		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=Form"+formid+"_Details.xlsx";

		response.setHeader(headerKey, headerValue);

		List<?> arrayh; // For headers
		String str = "select questionid from question_master where formid = '" + formid + "';";
		Query query = manager.createNativeQuery(str);
		arrayh = query.getResultList();

		System.err.println("this is arrayh" + arrayh);
		String[] arrayofheader = new String[arrayh.size() + 3];
		arrayofheader[0] = "Name";
		arrayofheader[1] = "FormTitle";
		arrayofheader[2] = "Date";

		int z = 3;
		for (Iterator<?> iterator = arrayh.iterator(); iterator.hasNext();) {
			Object ques = iterator.next();
			arrayofheader[z] = "Q:" + ques.toString();
			z++;
		}
		System.err.println(arrayofheader);

		for (int i = 0; i < arrayofheader.length; i++) {
			String string = arrayofheader[i];
			System.err.println(string);
		}
		// =======================================================================================
		// //form details
		List<Map<String, Object>> excelfinaldata = new ArrayList<Map<String, Object>>();

		List<?> arraydt;
		String str1 = "select distinct(createdon),titletext,createdby from form_master as f join answers_selected as a join question_master as i where f.formid = a.formid and f.formid = '"
				+ formid + "';";
		Query query1 = manager.createNativeQuery(str1);
		arraydt = query1.getResultList();

		for (Iterator<?> iterator = arraydt.iterator(); iterator.hasNext();) {
			Object object = (Object) iterator.next();

			Map<String, Object> rows = new HashMap<>();
			rows.put("FormTitle", ((Object[]) object)[1]);
			rows.put("Name", ((Object[]) object)[2]);
			rows.put("Date", ((Object[]) object)[0]);

			/*
			 * System.err.println(((Object[]) object)[0]); System.err.println(((Object[])
			 * object)[1]); System.err.println(((Object[]) object)[2]);
			 */
			
			List<?> arrayanss;

			String str5 = "select answerselected, questid from answers_selected where createdby = '"
					+ ((Object[]) object)[2] + "' and createdon = '" + ((Object[]) object)[0] + "';";
			Query query5 = manager.createNativeQuery(str5);
			arrayanss = query5.getResultList();

			int k = 1;
			for (Iterator<?> iterator2 = arrayanss.iterator(); iterator2.hasNext();) {
				Object object2 = (Object) iterator2.next();

				rows.put("Q:" + k, ((Object[]) object2)[0]);
				k++;
			}

			excelfinaldata.add(rows);
		}
		System.err.println("---------------------");
		System.err.println(excelfinaldata);

		CreateExcel createexcel = new CreateExcel(arrayofheader, excelfinaldata);

		createexcel.export(response);

	}

}
