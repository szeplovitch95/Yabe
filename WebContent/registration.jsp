<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" import ="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="container">
	<div class="row">
	  <div class="col-md-2 col-sm-2 col-lg-2"></div>
	  <div class="col-md-4 col-sm-4 col-lg-4">
	  </div>
	  <div class="col-md-6 col-sm-6 col-lg-6">
	    <a href="index.jsp" class="pull-right">
			<button type="button" class="btn btn-primary">Back to Login Page</button>
		</a>
	  </div>
	</div>
	<form class="form-horizontal" action="insertEndUser.jsp" method="post">
		<fieldset>
		<legend>Personal Information</legend>
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">First Name:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="text" name="firstName" placeholder="First Name" required autofocus/>			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Last Name:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="text" name="lastName" placeholder="Last Name" required/>			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Gender</label>			
			<div class="radio-inline col-md-1 col-lg-1 col-sm-1" style="padding-left: 35px;">
				<input type="radio" name="gender" value="male" checked/> Male
			</div>
			<div class="radio-inline col-md-1 col-lg-1 col-sm-1">			
				<input type="radio" name="gender" value="female"/> Female	
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Username:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="text" name="username" placeholder="Username" pattern="^[a-zA-Z][a-zA-Z0-9-_\.]{1,20}$" required/>			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Password:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="password" name="password" maxlength="20" placeholder="Password" required/>			
			</div>
		</div>
 		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Confirm Password</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="password" name="rePassword" maxlength="20" placeholder="Confirm Password" required/>			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Email:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="text" name="emailAddress" placeholder="Email Address" required/>			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Phone Number:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="text" name="phoneNum" placeholder="Format: 999-999-9999" maxlength="15" pattern="\d{3}[\-]\d{3}[\-]\d{4}" required/>			
			</div>
		</div>
	</fieldset>
	<fieldset>
	<legend>Payment Information</legend>
	<div class="form-group">
	        <label class="col-sm-2 col-md-2 col-lg-2 control-label" for="card-type">Credit Card Type:</label>
	        <div class="col-md-3 col-lg-3 col-sm-3">
	           <select class="form-control" name="card-type">
                <option>VISA</option>
                <option>Mastercard</option>
                <option>American Express</option>
              </select>
	        </div>
      	</div>
		<div class="form-group">
	        <label class="col-sm-2 col-md-2 col-lg-2 control-label" for="card-holder-name">Name on Card</label>
	        <div class="col-md-5 col-lg-5 col-sm-5">
	          <input type="text" class="form-control" name="card-holder-name" id="card-holder-name" placeholder="Card Holder's Name">
	        </div>
      	</div>
      <div class="form-group">
	        <label class="col-md-2 col-sm-2 col-lg-2 control-label" for="card-number">Card Number</label>
	        <div class="col-md-5 col-lg-5 col-sm-5">
	          <input type="text" class="form-control" name="card-number" id="card-number" placeholder="Debit/Credit Card Number">
	        </div>
      </div>
      <div class="form-group">
        <label class="col-md-2 col-sm-2 col-lg-2 control-label" for="expiry-month">Expiration Date</label>
        <div class="col-md-5 col-lg-5 col-sm-5">
          <div class="row">
            <div class="col-xs-5 col-sm-5 col-lg-5 col-md-5">
              <select class="form-control col-sm-2" name="expiry-month" id="expiry-month">
                <option>Month</option>
                <option value="01">Jan (01)</option>
                <option value="02">Feb (02)</option>
                <option value="03">Mar (03)</option>
                <option value="04">Apr (04)</option>
                <option value="05">May (05)</option>
                <option value="06">June (06)</option>
                <option value="07">July (07)</option>
                <option value="08">Aug (08)</option>
                <option value="09">Sep (09)</option>
                <option value="10">Oct (10)</option>
                <option value="11">Nov (11)</option>
                <option value="12">Dec (12)</option>
              </select>
             </div>
            <div class="col-xs-5 col-sm-5 col-lg-5 col-md-5">
              <select class="form-control" name="expiry-year">
                <option value="13">2013</option>
                <option value="14">2014</option>
                <option value="15">2015</option>
                <option value="16">2016</option>
                <option value="17">2017</option>
                <option value="18">2018</option>
                <option value="19">2019</option>
                <option value="20">2020</option>
                <option value="21">2021</option>
                <option value="22">2022</option>
                <option value="23">2023</option>
              </select>
            </div>
          </div>
        </div>
      </div>
      <div class="form-group">
	        <label class="col-md-2 col-sm-2 col-lg-2 control-label" for="cvv">Card CVV</label>
	        <div class="col-md-5 col-lg-5 col-sm-5">
	          <input type="text" class="form-control" name="cvv" id="cvv" placeholder="Security Code">
	        </div>
      </div>
	</fieldset>
	<fieldset>
		<legend>Shipping Information</legend>
      <div class="form-group">
	        <label class="col-md-2 col-sm-2 col-lg-2 control-label" for="shippingStreet">Address:</label>
	        <div class="col-md-5 col-lg-5 col-sm-5">
	          <input type="text" class="form-control" name="shipping-street" placeholder="Shipping Street">
	        </div>
      </div>
      <div class="form-group">
	        <label class="col-md-2 col-sm-2 col-lg-2 control-label" for="shippingCity">City:</label>
	        <div class="col-md-5 col-lg-5 col-sm-5">
	          <input type="text" class="form-control" name="shipping-city" placeholder="Shipping City">
	        </div>
      </div>
     <div class="form-group">
	        <label class="col-md-2 col-sm-2 col-lg-2 control-label" for="shippingStreet">State:</label>
	        <div class="col-md-5 col-lg-5 col-sm-5">
	          <input type="text" class="form-control" name="shipping-state" placeholder="Shipping State">
	        </div>
      </div>
      
      <div class="form-group">
	        <label class="col-md-2 col-sm-2 col-lg-2 control-label" for="zipCode">Zip Code:</label>
	        <div class="col-md-5 col-lg-5 col-sm-5">
	          <input type="text" class="form-control" name="zip-code" placeholder="Zip Code">
	        </div>
      </div>
	</fieldset>
	  <div class="form-group">
			 <div class="col-md-offset-6 col-sm-offset-6 col-lg-offset-6 col-md-10 col-sm-10 col-lg-10">
				<button class="btn btn-primary" type="submit">Sign Up</button>		
	    	</div>		
	  </div>
	</form>
	</div>
</body>
</html>