package com.efive.formmngmt.fillform;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.efive.formmngmt.addeditform.FormEntity;
import com.efive.formmngmt.addeditform.OptionEntity;
import com.efive.formmngmt.addeditform.QuestionEntity;
import com.efive.formmngmt.addeditform.formDTO;
import com.efive.formmngmt.formspage.FormPageService;
import com.efive.formmngmt.session.HibernateSessionFacConfig;

@Controller
public class FillformController {

	@Autowired
	HibernateSessionFacConfig hsessionFactory;
	
	@Autowired
	private FillformService fillformservice;
	
	@Autowired
	private FormPageService formpageservice;
	
	@Autowired
	private HttpServletRequest request;
	
	
	@GetMapping("/fill_form")
	public String gettingfrmdrop(Model model)
	{
		System.err.println(fillformservice.getAllformdetails());
		model.addAttribute("formdtt", fillformservice.getAllformdetails());
		
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
		
		
		return "fill_form";
	}
	
	
	
	@GetMapping("/fillformdata/{frmid}")
	public ResponseEntity<formDTO> getformforfilling(@PathVariable Integer frmid)
	{
		formDTO frmdto = new formDTO();
		System.err.println("preview :" +frmid);
		FormEntity formdatas1 = formpageservice.getAllformdata(frmid);
		frmdto.setAddformentity(formdatas1);
		
		Transaction transaction1 = null;
		List<QuestionEntity> fillformdrop1 = null;
		
		Session session1 = hsessionFactory.getCurrentSession();

		transaction1 = session1.beginTransaction();
		fillformdrop1 = session1.createNativeQuery("SELECT * FROM question_master where formid = "+frmid+";").addEntity(QuestionEntity.class).getResultList();
		transaction1.commit();
	//	System.err.println(fillformdrop5);
		frmdto.setAddquestionentity(fillformdrop1);
		
		Transaction transaction = null;
		List<OptionEntity> fillformdrop = null;
		
		Session session = hsessionFactory.getCurrentSession();

		transaction = session.beginTransaction();
		fillformdrop = session.createNativeQuery("SELECT * FROM option_master where formid = "+frmid+";").addEntity(OptionEntity.class).getResultList();
		transaction.commit();
	//	System.err.println(fillformdrop5);
		frmdto.setOptionentity(fillformdrop);
		
		
		return new ResponseEntity<>(frmdto, HttpStatus.OK);
	}
	
	@PostMapping("/saveformfill")
	public String saveanswerinput(@RequestBody List<FillFormEntity> fillformjson)
	{	
		System.err.println("----------------------------------------------");
		System.err.println(fillformjson);
		HttpSession session = request.getSession();
		
		Timestamp time=new Timestamp(System.currentTimeMillis());
		for(FillFormEntity fill : fillformjson)
		{
			fill.setCreatedby((String) session.getAttribute("emailid"));
			fill.setCreatedon(time);
			fillformservice.saveanswerdt(fill);
		}	
		return "fill_form";
	}

}
