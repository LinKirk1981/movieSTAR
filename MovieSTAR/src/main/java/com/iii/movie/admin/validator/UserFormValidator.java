package com.iii.movie.admin.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.iii.movie.admin.imoviememberservice.MovieStarService;
import com.iii.movie.admin.model.IMovieMember;

@Component
public class UserFormValidator implements Validator {

	@Autowired
	@Qualifier("emailValidator")
	EmailValidator emailValidator;

	@Autowired
	MovieStarService movieStarService;

	@Override
	public boolean supports(Class<?> clazz) {
		return IMovieMember.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
        
		IMovieMember iMovieMember = (IMovieMember) target;
        
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "userForm.name.notEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "emailbox", "userForm.emailbox.notEmpty");
		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "account", "userForm.account.notEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cell", "userForm.cell.notEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "userForm.password.notEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmpassword", "userForm.confirmpassword.notEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberid", "userForm.memberid.notEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "salary", "userForm.salary.notEmpty");
		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "userForm.title.notEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "skill", "userForm.skill.notEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "status", "userForm.status.notEmpty");       
		
		if (!emailValidator.valid(iMovieMember.getEmailbox())) {
			errors.rejectValue("emailbox", "userForm.emailbox.pattern");
		}

//		if (iMovieMember.getName() == null) {
//			errors.rejectValue("name", "userForm.name.notEmpty");
//		}
//		
//		if (iMovieMember.getAccount() == null) {
//			errors.rejectValue("account", "userForm.account.notEmpty");
//		}
//		
//		if (iMovieMember.getCell() == null) {
//			errors.rejectValue("cell", "userForm.cell.notEmpty");
//		}
		
//		if (iMovieMember.getConfirmpassword() == null) {
//			errors.rejectValue("confirmpassword", "userForm.confirmpassword.notEmpty");
//		}
		
//		if (iMovieMember.getMemberid() == null) {
//			errors.rejectValue("memberid", "userForm.memberid.notEmpty");
//		}

		if (!iMovieMember.getPassword().equals(iMovieMember.getConfirmpassword())) {
			errors.rejectValue("confirmPassword", "userform.confirmPassword.diff");
		}
		
//		if (iMovieMember.getSkill() == null || iMovieMember.getSkill().size() < 2) {
//			errors.rejectValue("skill", "userForm.skill.valid");
//		}
//				
//		if (iMovieMember.getSalary().isEmpty()) {
//			errors.rejectValue("salary", "userForm.salary.notEmpty");
//		}
//		
//		if (iMovieMember.getStatus() == null || iMovieMember.getStatus().size() <= 0) {
//			errors.rejectValue("status", "userForm.status.valid");
//		}
//		
		if (iMovieMember.getTitle() == null || iMovieMember.getTitle().size() <= 0) {
			errors.rejectValue("title", "userForm.title.valid");
		}

	}

}
