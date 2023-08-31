package demo_final.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;


@Controller

public class PaymentController {
    
    @RequestMapping("/payment/list.do")
	public String list(Model model) {

		

		return "payment/payment_list";
	}


	private IamportClient api;

	public PaymentController(){
		this.api = new IamportClient("O7618368412502848", "0qVtYKDKjbH1GOkLRLc7K3QD4TvPaXAirYnINtvPxG07rddNHRCWWDH4YFj6NZNgagCIyZCYp8XvmGZq");

	}

	@ResponseBody
	@RequestMapping(value = "verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
		Model model, 
		Locale locale, 
		HttpSession session, @PathVariable(value = "imp_uid") String imp_uid) throws IamportResponseException, IOException{

			return api.paymentByImpUid(imp_uid);
		}
	
	

}


