package com.efive.formmngmt.completedform;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestBody;

import com.efive.formmngmt.session.HibernateSessionFacConfig;

@Controller
public class CompletedformController {

	@Autowired
	HibernateSessionFacConfig hsessionFactory;

	@Autowired
	private HttpServletRequest request;

	@GetMapping("/complete_form")
	public String completePage(Model model) {

		HttpSession session5 = request.getSession();

		if (session5.getAttribute("status").equals("success")) {

			String email = (String) session5.getAttribute("emailid");
			Transaction transaction1 = null;
			List<?> taskbardata = null;
			System.err.println(email);
			Session session9 = hsessionFactory.getCurrentSession();

			transaction1 = session9.beginTransaction();
			taskbardata = session9
					.createNativeQuery(
							"SELECT first_name, email, image FROM user_master where email = '" + email + "';")
					.getResultList();
			System.err.println(taskbardata);

			transaction1.commit();
			model.addAttribute("headerdata", taskbardata);
			session9.close();
			
			if(session5.getAttribute("role").equals(1))
			{
				Transaction transaction2 = null;
				List<?> datatabledata = null;

				Session session2 = hsessionFactory.getCurrentSession();

				transaction2 = session2.beginTransaction();
				datatabledata = session2.createNativeQuery(
						"SELECT distinct(createdon),createdby,x.formid,y.titletext FROM form_management.answers_selected as x join form_management.form_master as y where x.formid = y.formid;")
						.getResultList();
				System.err.println(datatabledata);

				transaction2.commit();
				model.addAttribute("datatabledata", datatabledata);
				session2.close();
			}
			else if(session5.getAttribute("role").equals(2))
			{
				Transaction transaction2 = null;
				List<?> datatabledata = null;
				
				Session session2 = hsessionFactory.getCurrentSession();

				transaction2 = session2.beginTransaction();
				datatabledata = session2.createNativeQuery(
						"SELECT distinct(createdon),createdby,x.formid,y.titletext FROM form_management.answers_selected as x join form_management.form_master as y where x.formid = y.formid and createdby = '"+session5.getAttribute("emailid")+"';")
						.getResultList();
				System.err.println(datatabledata);

				transaction2.commit();
				model.addAttribute("datatabledata", datatabledata);
				session2.close();

			}
			
		}

		return "completed_form";
	}
	

	@GetMapping("/prvansdata/{creby}/{creon}")
	public ResponseEntity<?> getdataforprv(@PathVariable String creby, @PathVariable Timestamp creon) {
		System.err.println(creby);
		System.err.println(creon);

		Transaction transaction1 = null;
		List<?> ansformdt = null;

		Session session1 = hsessionFactory.getCurrentSession();

		transaction1 = session1.beginTransaction();
		ansformdt = session1.createNativeQuery(
				"select distinct(titletext),textarea,x.formid from form_master as x join answers_selected as y where x.formid = y.formid and createdby = '"
						+ creby + "' and createdon = '" + creon + "';")
				.getResultList();
		System.err.println(ansformdt);

		transaction1.commit();

		return new ResponseEntity<>(ansformdt, HttpStatus.OK);
	}

	@GetMapping("/quesansdata/{creby}/{creon}")
	public ResponseEntity<?> getdataforprvques(@PathVariable String creby, @PathVariable Timestamp creon) {
		System.err.println(creby);
		System.err.println(creon);

		Transaction transaction1 = null;
		List<?> quesformdt = null;

		Session session1 = hsessionFactory.getCurrentSession();

		transaction1 = session1.beginTransaction();
		quesformdt = session1.createNativeQuery(
				"select questiondesc,questionlabel,answerselected,questid from question_master as x join answers_selected as y where x.formid = y.formid and x.questionid = y.questid and  createdby = '"
						+ creby + "' and createdon = '" + creon + "';")
				.getResultList();
		System.err.println(quesformdt);

		transaction1.commit();

		return new ResponseEntity<>(quesformdt, HttpStatus.OK);
	}

}
