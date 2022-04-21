package com.efive.formmngmt.addeditform;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.efive.formmngmt.session.HibernateSessionFacConfig;

@Controller
public class FormController {

	@Autowired
	HibernateSessionFacConfig hsessionFactory;

	@Autowired
	private FormService formservice;

	@Autowired
	private QuestionService questionservice;

	@Autowired
	private OptionService optionservice;
	
	@Autowired
	private HttpServletRequest request;

	@PostMapping("/formdatasave")
	public String formadd(@RequestBody formDTO formDTO) {
		
		int frmid = formDTO.getAddformentity().getFormid();
	//	System.err.println(frmid);
		
		Transaction transaction = null;
		List<?> allformid = null;

		Session session = hsessionFactory.getCurrentSession();

		transaction = session.beginTransaction();
		allformid = session.createNativeQuery("SELECT formid FROM form_master;").getResultList();

	//	System.err.println("------------->" + allformid);

		transaction.commit();
		if(!(allformid.contains(frmid)))
		{
			formservice.saveformdetails(formDTO.getAddformentity());

			List<QuestionEntity> questionarr = formDTO.getAddquestionentity();

			for (QuestionEntity quesentity : questionarr) {
//				System.err.println("DEscr"+quesentity.getQuestiondesc());
				questionservice.savequesdetail(quesentity);
			}

//			System.err.println(formDTO.getOptionentity());
			List<OptionEntity> optionarr = formDTO.getOptionentity();

			System.err.println("option arr obj" + optionarr);

			for (OptionEntity optentity : optionarr) {
				int i = 0;

				String opt[] = optentity.getOptions().split(",");

				for (int k = 0; k < opt.length; k++) {
					System.err.println(opt[k]);

					i++;
					OptionEntity entityy = new OptionEntity();

					entityy.setFormid(optentity.getFormid());
					entityy.setQuestionid(optentity.getQuestionid());
					entityy.setOptions(opt[k]);
					entityy.setOid(i);

					optionservice.saveoptsdetails(entityy);
				}
			}
		}
		else
		{
			System.err.println("You are editing in database");
			String alianm = formDTO.getAddformentity().getAliasname();
			String ttext = formDTO.getAddformentity().getTitletext();
			String module = formDTO.getAddformentity().getModule();
			String charcs = formDTO.getAddformentity().getCharacteristic();
			String subcharas = formDTO.getAddformentity().getSubcharacteristic();
			String cperiod = formDTO.getAddformentity().getComplianceperiod();
			String edate = formDTO.getAddformentity().getEffectivedate();
			String reece = formDTO.getAddformentity().getRecurrence();
			String statmnt = formDTO.getAddformentity().getStartmonth();
			String txta = formDTO.getAddformentity().getTextarea();
			int activ = formDTO.getAddformentity().getActive();
						
			Transaction transaction1 = null;
	
			Session session1 = hsessionFactory.getCurrentSession();

			transaction1 = session1.beginTransaction();
			
			String sql = "Update form_master set aliasname = '"+alianm+"',titletext = '"+ttext+"',module = '"+module+"', characteristic = '"+charcs+"',"
					+ "subcharacteristic= '"+subcharas+"',complianceperiod = '"+cperiod+"',"
					+ "effectivedate = '"+edate+"',recurrence = '"+reece+"',"
					+ "textarea = '"+txta+"',active = '"+activ+"',"
					+ "startmonth = '"+statmnt+"' where formid="+frmid+ ";";
			
			Query query = session1.createNativeQuery(sql);
			query.executeUpdate();


			transaction1.commit();
			
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// ques edit
			Transaction transaction3 = null;

			Session session3 = hsessionFactory.getCurrentSession();

			transaction3 = session3.beginTransaction();
			Query query1=  session3.createNativeQuery("delete FROM question_master where formid = "+frmid+";");

			query1.executeUpdate();

			transaction3.commit();

			
			List<QuestionEntity> questionarr = formDTO.getAddquestionentity();
			Iterator<?> itr = questionarr.iterator();
			
			while(itr.hasNext())
			{
				QuestionEntity quesentyy= (QuestionEntity) itr.next();
				questionservice.savequesdetail(quesentyy);
			}
////////////////////////////////////////////////////////////////////////////////////////////////////////////// options edit 
			
			Transaction transaction2 = null;

			Session session2 = hsessionFactory.getCurrentSession();

			transaction2 = session2.beginTransaction();
			Query query2=  session2.createNativeQuery("delete FROM option_master where formid = "+frmid+";");

			query2.executeUpdate();

			transaction2.commit();

			
			List<OptionEntity> optionarr = formDTO.getOptionentity();

			System.err.println("option arr obj" + optionarr);

			for (OptionEntity optentity : optionarr) {
				int i = 0;

				String opt[] = optentity.getOptions().split(",");

				for (int k = 0; k < opt.length; k++) {
					System.err.println(opt[k]);

					i++;
					OptionEntity entityy = new OptionEntity();

					entityy.setFormid(optentity.getFormid());
					entityy.setQuestionid(optentity.getQuestionid());
					entityy.setOptions(opt[k]);
					entityy.setOid(i);

					optionservice.saveoptsdetails(entityy);
				}
			}		
			
		}
		
		

		return "add_edit_form";

	}

	@GetMapping("/addbtn")
	public ResponseEntity<Object> addbtnidgeneration() {
		Transaction transaction3 = null;
		List<?> maxformid = null;

		Session session3 = hsessionFactory.getCurrentSession();

		transaction3 = session3.beginTransaction();
		maxformid = session3.createNativeQuery("SELECT count(*)+1 FROM form_master;").getResultList();

//		System.err.println("------------->" + fillformdrop2);

		transaction3.commit();
		// model.addAttribute("formno", fillformdrop3);
		return new ResponseEntity<>(maxformid, HttpStatus.OK);
	}

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@GetMapping("/add_edit_for")
	public String getformodule(Model model) {
		
		HttpSession session5 = request.getSession();
		
		if(session5.getAttribute("status").equals("success"))
		{
			
			String email = (String) session5.getAttribute("emailid");
			Transaction transaction1 = null;
			List<?> taskbardata = null;
			System.err.println(email);
			Session session1 = hsessionFactory.getCurrentSession();

			transaction1 = session1.beginTransaction();
			taskbardata = session1.createNativeQuery("SELECT first_name, email, image FROM user_master where email = '"+email+"';").getResultList();
			System.err.println(taskbardata);
			
			transaction1.commit();
			model.addAttribute("headerdata", taskbardata);
			session1.close();
		}
		
		
		
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

		/*
		 * Transaction transaction3 = null; List<?> fillformdrop3 = null;
		 * 
		 * Session session3 = hsessionFactory.getCurrentSession();
		 * 
		 * transaction3 = session3.beginTransaction(); fillformdrop3 =
		 * session3.createNativeQuery( "SELECT count(*)+1 FROM form_master;")
		 * .getResultList();
		 * 
		 * // System.err.println("------------->" + fillformdrop2);
		 * 
		 * transaction3.commit(); model.addAttribute("formno", fillformdrop3);
		 */

		return "add_edit_form";

	}

	@GetMapping("/modulechng/{mod}")
	public ResponseEntity<Object> updatechara(@PathVariable Integer mod) {
		Transaction transaction = null;
		List<?> fillformdrop = null;

		Session session = hsessionFactory.getCurrentSession();

		transaction = session.beginTransaction();
		fillformdrop = session.createNativeQuery(
				"Select * from characteristics where characteristicID IN (SELECT characteristicID FROM module_chara_mapping where moduleid = "
						+ mod + ");")
				.getResultList();

//		System.err.println("------------->" + fillformdrop);

		transaction.commit();

		return new ResponseEntity<Object>(fillformdrop, HttpStatus.OK);

	}

	@GetMapping("/characchng/{mod}")
	public ResponseEntity<Object> updatesubchara(@PathVariable Integer mod) {
		Transaction transaction = null;
		List<?> fillformdrop = null;

		Session session = hsessionFactory.getCurrentSession();

		transaction = session.beginTransaction();
		fillformdrop = session
				.createNativeQuery("Select * from subcharacteristics where characteristicID =" + mod + ";")
				.getResultList();

//		System.err.println("------------->" + fillformdrop);

		transaction.commit();

		return new ResponseEntity<Object>(fillformdrop, HttpStatus.OK);

	}

	// =========================================================================================================

}
//Transaction transaction1 = null;
//
//Session session1 = hsessionFactory.getCurrentSession();
//
//transaction1 = session1.beginTransaction();
//NativeQuery query = session1.createNativeQuery("SELECT * FROM form_master where formid ="+frmid+";");
//query.addEntity(FormEntity.class);
//
//List<FormEntity> formdt = query.list();
//for (Iterator<FormEntity> iterator = formdt.iterator(); iterator.hasNext();){
//	FormEntity formenty = (FormEntity) iterator.next();
//	System.err.println(formenty.getTextarea());
//}
//
//transaction1.commit();





//List<OptionEntity> optionarr = formDTO.getOptionentity();
//Iterator<?> itr1 = optionarr.iterator();
//
//while(itr1.hasNext())
//{
//	OptionEntity optentyy=  (OptionEntity) itr.next();
//	questionservice.savequesdetail(optentyy);
//}
//