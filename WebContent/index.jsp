<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Vehicle Monitoring System</title>

<script>
	function checkFName() {

		var fname = document.f1.fname.value;
		var l = fname.length;

		if (l <= 0) {
			t1.innerHTML = "Not empty";
			document.f1.fname.focus();
		}
		var c = 0;
		var aChar;
		for ( var i = 0; i != l; i++) {
			aChar = fname.substring(i, i + 1)
			if (aChar.search(/[A-Za-z]/) == -1) {
				c = 2;
				break;
			} else {

				c = 3;

			}
		}
		if (c == 2) {
			t1.innerHTML = "Not valid";
			document.f1.fname.focus();

		}
		if (c == 3) {
			t1.innerHTML = "<img src=\"./images/correct.JPG \">"
		}

	}

	function checkLName() {

		var lname = document.f1.lname.value;
		var l1 = lname.length;
		if (l1 <= 0) {
			t2.innerHTML = "Not empty";
			document.f1.lname.focus();
		}
		var c1 = 0;
		var aChar1;
		for ( var i = 0; i != l1; i++) {
			aChar1 = lname.substring(i, i + 1)
			if (aChar1.search(/[A-Za-z]/) == -1) {
				c1 = 2;
			} else {
				c1 = 3;
			}
		}
		if (c1 == 2) {
			t2.innerHTML = "Not valid";
			document.f1.lname.focus();

		}
		if (c1 == 3) {
			t2.innerHTML = "<img src=\"./images/correct.JPG \">"
		}

	}

	function checkEId() {

		var eid = document.f1.emid.value;
		if (eid.search(/[a-zA-Z]\w+\@[a-zA-Z]\w+/) != 0) {
			t3.innerHTML = "Not Valid";
			document.f1.emid.focus();

		}
	}
	function checkId() {
		var id = document.f1.uid.value;
		if (id.search(/[a-zA-Z]\w+/) != 0) {
			t4.innerHTML = "Not Empty";
			document.f1.uid.focus();
		}
		var l3 = id.length;
		var c3 = 0;
		var aChar3;
		for ( var i = 0; i != l3; i++) {
			aChar3 = id.substring(i, i + 1)
			if (aChar3.search(/[A-Za-z]/) == -1) {
				c3 = 2;
			} else {
				c3 = 3;
			}
		}
		if (c3 == 2) {
			t4.innerHTML = "Not valid";
			document.f1.uid.focus();

		}
		if (c3 == 3) {
			t4.innerHTML = "<img src=\"./images/correct.JPG \">"
		}
	}
	function checkPwd() {
		var pwd1 = document.f1.pwd.value;
		if (pwd1.length < 6) {
			t5.innerHTML = "Not valid";
			document.f1.pwd.focus();

		} else {
			t5.innerHTML = "<img src=\"./images/correct.JPG \">"
		}
	}
	function chechRpwd() {
		var pwd1 = document.f1.pwd.value;
		var pwd2 = document.f1.rpwd.value;
		if (pwd1 != pwd2) {
			t6.innerHTML = "Not same";
			document.f1.rpwd.focus();

		} else {
			t6.innerHTML = "<img src=\"./images/correct.JPG \">"
		}
	}

	function checkNo() {
		var phno = document.f1.pno.value;
		if (phno.length != 10) {
			t8.innerHTML = "Invalid Phone no";
			document.f1.pno.focus();

		}

		var c5 = 0;
		var aChar5 = phno;
		for ( var i = 0; i != 10; i++) {
			aChar5 = phno.substring(i, i + 1)
			if (aChar5.search(/[0-9]+/) == -1) {
				c5 = 2;
			} else {
				c5 = 3;
			}
		}
		if (c5 == 2) {
			t8.innerHTML = "Invalid Phone no";
			document.f1.pno.focus();
		}
		if (c5 == 3) {
			t8.innerHTML = "<img src=\"./Images/correct.JPG \">"
		}
	}

	function checkButton() {

		checkId();
		checkPwd();
	}
</script>
</head>
<body>
	
			<%@include file="Loheader.jsp"%>
			
			
			<div class="jumbotron jumbotron-fluid mb-5">
<div class="col span_2_of_3">
				  <div class="contact-form">
				  	<h3>User Login Form</h3>
				  	   <div class="col-lg-5">
                    <div class="bg-primary py-5 px-4 px-sm-5">
                            <div class="form-group">
					      <form action="session.jsp" name="f1" id="f1">
					     
					      
					    	<div>
						    	
						    	<span><input name="uid" type="text" class="form-control border-0 p-4"  placeholder="User Name" maxlength="45" required="required"  ></span>
						  		<span><label id="t4"></label> </span> 	
						    </div>
						    <div>
						    	
						    	<span><input  name="pwd" id="pwd" value="Password"  type="password" class="form-control border-0 p-4"   maxlength="45" required="required"  ></span>
						    	<span><label id="t5"></label></span>
						    </div>
						   <!--  <div>
						    	<span><label class="labelform">OTP</label></span>
						    	<span><input  name="pwd" id="pwd" onblur="checkPwd()" type="password" class="textbox"  maxlength="45" required="required"  ></span>
						    	<span><label id="t5"></label></span>
						    </div> -->
						     
						   <div>
						   		
						   		<span><input class="btn btn-dark btn-block border-0 py-3" type="submit" value="Login" ></span>
						  </div>
						  
					    </form>
				    </div>
  				</div>		
  						
  				<div class="clear"></div>
</div>
			
			