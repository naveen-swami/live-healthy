<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="bean.Image"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">



<style>
* {
	box-sizing: border-box
}

body, html {
	height: 100%;
	margin: 0;
	font-family: Arial;
	background-color: lightblue;
}

/* .help {
	background-color: yellow;
} */

.tablink3 {
	background-color: #555;
	color: white;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	font-size: 17px;
	width: 25%;
}

.tablink3:hover {
	background-color: #777;
}

/* Style the tab content (and add height:100% for full page content) */
.tabcontent3 {
	/* color: white; */
	display: none;
	padding: 100px 20px;
	height: 100%;
}

/* for change color of the content 
#Home {
	background-color: red;
}

#News {
	background-color: green;
}

#Contact {
	background-color: blue;
}

#About {
	background-color: orange;
}
 */
 
 
/* Style the tab */
.tab1 {
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab1 button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
	font-size: 14px;
}

/* Change background color of buttons on hover */
.tab1 button:hover {
	background-color: #ddd;
}

/* Create an active/current tablink class */
.tab1 button.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent1 {
	display: none;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
}

/* Style the tab */
.tab {
	float: left;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
	width: 20%;
	height: 600px;
}

/* Style the buttons inside the tab */
.tab button {
	display: block;
	background-color: inherit;
	color: black;
	padding: 22px 16px;
	width: 100%;
	border: none;
	outline: none;
	text-align: left;
	cursor: pointer;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	float: left;
	padding: 0px 12px;
	border: 1px solid #ccc;
	width: 70%;
	border-left: none;
	height: 300px;
}

#div1 {
	height: 100px;
	background-color: grey;
}
</style>



</head>
<%
	Session se = null;
	Transaction tran = null;

	SessionFactory sf = null;
	sf = new Configuration().configure().addAnnotatedClass(Image.class).buildSessionFactory();
	se = sf.openSession();
	tran = se.beginTransaction();
	Query qr = se.createQuery("from Image");
	List<Image> li = qr.list();

	tran.commit();
	String type = null, name = null, descrption = null, image = null, path = null;
%>


<body>

	<div id="div1">
		<center>
			<font size="10" style="color: white;">Live Healthy</font>
		</center>
		<div style="background-color: grey;">
			<p align="right">
				<font size="5">Contact:9587403995
					&nbspemail:Naveen96swami@gmail.com</font>
			</p>
		</div>
	</div>
	<div class="tab">
		<button class="tablinks" onclick="openCity(event, 'London')"
			id="defaultOpen">Gym</button>
		<button class="tablinks" onclick="openCity(event, 'Paris')">Yoga</button>
		<button class="tablinks" onclick="openCity(event, 'Tokyo')">Tips
			& Help</button>
		<form>
			<button type="submit" formaction="index.jsp">logout</button>
			<button type="submit" formaction="change.jsp">change Password</button>
		</form>

	</div>

	<div id="London" class="tabcontent">


		<div class="tab1">
			<button class="tablinks1" onclick="openCity1(event, 'chest')" id="defaultOpen4">Chest
				Exercises</button>
			<button class="tablinks1" onclick="openCity1(event, 'biceps')">Biceps
				Exercises</button>
			<button class="tablinks1" onclick="openCity1(event, 'back')">Back
				Exercises</button>
			<button class="tablinks1" onclick="openCity1(event, 'leg')">Leg
				Exercises</button>
			<button class="tablinks1" onclick="openCity1(event, 'shoulder')">Shoulder
				Exercises</button>
			<button class="tablinks1" onclick="openCity1(event, 'triceps')">Triceps
				Exercises</button>
		</div>

		<div id="chest" class="tabcontent1">
			<center><h1>Chest</h1></center>
			<%
				for (Image st : li) {

					type = st.getType();
					name = st.getName();
					descrption = st.getDescrption();
					image = st.getImage();
					path = st.getPath();
					if (type.equals("chest")) {
						out.println("<center><h1>" + name + "</h1></center>");
						int i = descrption.length();
						String substr = "";
						char ch;
						int k = 0;
						for (int j = 0; j < i; j++) {
							ch = descrption.charAt(j);
							if (ch == '.') {
								substr = descrption.substring(k, j);
			%>
			<%=substr%><br> <br>
			<%
				k = j + 1;
							}
						}
						k = 0;
						int z = image.length(), a = 1;
						for (int j = 0; j < z; j++) {
							ch = image.charAt(j);
							if (ch == '#') {
								String substr2 = "";
								substr = image.substring(k, j);
								int l = substr.length();
								for (int m = 0; m < l; m++) {
									substr2 = substr.substring(l - 4);
									if (substr2.equals(".mp4")) {
			%>
			<br>
			<h3>Video</h3>
			<video width="320" height="240" controls> <source
				src="file/<%=substr%>" type="video/mp4"></video>
			<%
				break;
									} else {
			%>
			<font size="5">Step<%=a%></font><img src="file/<%=substr%>">&nbsp&nbsp&nbsp&nbsp
			<%
				a++;
										break;
									}
								}

								k = j + 1;

							}
						}
						k = 0;

					}
				}
			%>

		</div>

		<div id="biceps" class="tabcontent1">
			<center><h1>Biceps</h1></center>

			<%
				for (Image st : li) {

					type = st.getType();
					name = st.getName();
					descrption = st.getDescrption();
					image = st.getImage();
					path = st.getPath();
					if (type.equals("biceps")) {
						out.println("<center><h1>" + name + "</h1></center>");
						int i = descrption.length();
						String substr = "";
						char ch;
						int k = 0;
						for (int j = 0; j < i; j++) {
							ch = descrption.charAt(j);
							if (ch == '.') {
								substr = descrption.substring(k, j);
			%>
			<%=substr%><br> <br>
			<%
				k = j + 1;
							}
						}
						k = 0;
						int z = image.length(), a = 1;
						for (int j = 0; j < z; j++) {
							ch = image.charAt(j);
							if (ch == '#') {
								String substr2 = "";
								substr = image.substring(k, j);
								int l = substr.length();
								for (int m = 0; m < l; m++) {
									substr2 = substr.substring(l - 4);
									if (substr2.equals(".mp4")) {
			%>
			<br>
			<h3>Video</h3>
			<video controls> <source src="file/<%=substr%>"
				type="video/mp4"></video>
			<%
				break;
									} else {
			%>
			<font size="5">Step<%=a%></font><img src="file/<%=substr%>">&nbsp&nbsp&nbsp&nbsp
			<%
				a++;
										break;
									}
								}

								k = j + 1;

							}
						}
						k = 0;

					}
				}
			%>


		</div>

		<div id="back" class="tabcontent1">
			<center><h1>Back</h1></center>

			<%
				for (Image st : li) {

					type = st.getType();
					name = st.getName();
					descrption = st.getDescrption();
					image = st.getImage();
					path = st.getPath();
					if (type.equals("back")) {
						out.println("<center><h1>" + name + "</h1></center>");
						int i = descrption.length();
						String substr = "";
						char ch;
						int k = 0;
						for (int j = 0; j < i; j++) {
							ch = descrption.charAt(j);
							if (ch == '.') {
								substr = descrption.substring(k, j);
			%>
			<%=substr%><br> <br>
			<%
				k = j + 1;
							}
						}
						k = 0;
						int z = image.length(), a = 1;
						for (int j = 0; j < z; j++) {
							ch = image.charAt(j);
							if (ch == '#') {
								String substr2 = "";
								substr = image.substring(k, j);
								int l = substr.length();
								for (int m = 0; m < l; m++) {
									substr2 = substr.substring(l - 4);
									if (substr2.equals(".mp4")) {
			%>
			<br>
			<h3>Video</h3>
			<video controls> <source src="file/<%=substr%>"
				type="video/mp4"></video>
			<%
				break;
									} else {
			%>
			<font size="5">Step<%=a%></font><img src="file/<%=substr%>">&nbsp&nbsp&nbsp&nbsp
			<%
				a++;
										break;
									}
								}

								k = j + 1;

							}
						}
						k = 0;

					}
				}
			%>


		</div>
		<div id="leg" class="tabcontent1">
			<center><h1>Leg</h1></center>
			<%
				for (Image st : li) {

					type = st.getType();
					name = st.getName();
					descrption = st.getDescrption();
					image = st.getImage();
					path = st.getPath();
					if (type.equals("leg")) {
						out.println("<center><h1>" + name + "</h1></center>");
						int i = descrption.length();
						String substr = "";
						char ch;
						int k = 0;
						for (int j = 0; j < i; j++) {
							ch = descrption.charAt(j);
							if (ch == '.') {
								substr = descrption.substring(k, j);
			%>
			<%=substr%><br> <br>
			<%
				k = j + 1;
							}
						}
						k = 0;
						int z = image.length(), a = 1;
						for (int j = 0; j < z; j++) {
							ch = image.charAt(j);
							if (ch == '#') {
								String substr2 = "";
								substr = image.substring(k, j);
								int l = substr.length();
								for (int m = 0; m < l; m++) {
									substr2 = substr.substring(l - 4);
									if (substr2.equals(".mp4")) {
			%>
			<br>
			<h3>Video</h3>
			<video controls> <source src="file/<%=substr%>"
				type="video/mp4"></video>
			<%
				break;
									} else {
			%>
			<font size="5">Step<%=a%></font><img src="file/<%=substr%>">&nbsp&nbsp&nbsp&nbsp
			<%
				a++;
										break;
									}
								}

								k = j + 1;

							}
						}
						k = 0;

					}
				}
			%>

		</div>

		<div id="shoulder" class="tabcontent1">
			<center><h1>Shoulder</h1></center>

			<%
				for (Image st : li) {

					type = st.getType();
					name = st.getName();
					descrption = st.getDescrption();
					image = st.getImage();
					path = st.getPath();
					if (type.equals("shoulder")) {
						out.println("<center><h1>" + name + "</h1></center>");
						int i = descrption.length();
						String substr = "";
						char ch;
						int k = 0;
						for (int j = 0; j < i; j++) {
							ch = descrption.charAt(j);
							if (ch == '.') {
								substr = descrption.substring(k, j);
			%>
			<%=substr%><br> <br>
			<%
				k = j + 1;
							}
						}
						k = 0;
						int z = image.length(), a = 1;
						for (int j = 0; j < z; j++) {
							ch = image.charAt(j);
							if (ch == '#') {
								String substr2 = "";
								substr = image.substring(k, j);
								int l = substr.length();
								for (int m = 0; m < l; m++) {
									substr2 = substr.substring(l - 4);
									if (substr2.equals(".mp4")) {
			%>
			<br>
			<h3>Video</h3>
			<video controls> <source
				src="file/<%=substr%>" type="video/mp4"></video>
			<%
				break;
									} else {
			%>
			<font size="5">Step<%=a%></font><img src="file/<%=substr%>"
				>&nbsp&nbsp&nbsp&nbsp
			<%
				a++;
										break;
									}
								}

								k = j + 1;

							}
						}
						k = 0;

					}
				}
			%>


		</div>

		<div id="triceps" class="tabcontent1">
			<center><h1>Triceps</h1></center>

			<%
				for (Image st : li) {

					type = st.getType();
					name = st.getName();
					descrption = st.getDescrption();
					image = st.getImage();
					path = st.getPath();
					if (type.equals("triceps")) {
						out.println("<center><h1>" + name + "</h1></center>");
						int i = descrption.length();
						String substr = "";
						char ch;
						int k = 0;
						for (int j = 0; j < i; j++) {
							ch = descrption.charAt(j);
							if (ch == '.') {
								substr = descrption.substring(k, j);
			%>
			<%=substr%><br> <br>
			<%
				k = j + 1;
							}
						}
						k = 0;
						int z = image.length(), a = 1;
						for (int j = 0; j < z; j++) {
							ch = image.charAt(j);
							if (ch == '#') {
								String substr2 = "";
								substr = image.substring(k, j);
								int l = substr.length();
								for (int m = 0; m < l; m++) {
									substr2 = substr.substring(l - 4);
									if (substr2.equals(".mp4")) {
			%>
			<br>
			<h3>Video</h3>
			<video  controls> <source
				src="file/<%=substr%>" type="video/mp4"></video>
			<%
				break;
									} else {
			%>
			<font size="5">Step<%=a%></font><img src="file/<%=substr%>"
				>&nbsp&nbsp&nbsp&nbsp
			<%
				a++;
										break;
									}
								}

								k = j + 1;

							}
						}
						k = 0;

					}
				}
			%>



		</div>

	</div>

	<div id="Paris" class="tabcontent">


		<button class="tablink3" onclick="openPage('Home', this, 'red')" id="defaultOpen3">Movement
		</button>
		<button class="tablink3" onclick="openPage('News', this, 'green')"
			>Restorative</button>
		<button class="tablink3" onclick="openPage('Contact', this, 'blue')">Alignment</button>
		<button class="tablink3" onclick="openPage('About', this, 'orange')">Heated</button>


		<div id="Home" class="tabcontent3">
			<center>
				<h3>Movement Style</h3>
			</center>
			<p>During movement- and power-focused yoga, the poses are
				synchronized to the breath. Typical poses (called asanas) include
				sun salutations, as well as seated, standing and balancing postures.
				Since it involves near-constant motion of the entire body, this type
				of yoga is a popular choice for those who enjoy a challenging
				workout. The practice is smooth and uninterrupted, with limited
				'held' poses. Students learn to observe whatever arises in their
				bodies without judging or reacting to it. Classes vary in speed and
				difficulty, with modifications offered for beginners and those with
				injuries. Sessions often begin with a brief meditation during which
				you are invited to leave outside worries behind and connect with the
				space and your body.</p>

			<%
				for (Image st : li) {

					type = st.getType();
					name = st.getName();
					descrption = st.getDescrption();
					image = st.getImage();
					path = st.getPath();
					if (type.equals("movement")) {
						out.println("<center><h1>" + name + "</h1></center>");
						int i = descrption.length();
						String substr = "";
						char ch;
						int k = 0;
						for (int j = 0; j < i; j++) {
							ch = descrption.charAt(j);
							if (ch == '.') {
								substr = descrption.substring(k, j);
			%>
			<%=substr%><br> <br>
			<%
				k = j + 1;
							}
						}
						k = 0;
						int z = image.length(), a = 1;
						for (int j = 0; j < z; j++) {
							ch = image.charAt(j);
							if (ch == '#') {
								String substr2 = "";
								substr = image.substring(k, j);
								int l = substr.length();
								for (int m = 0; m < l; m++) {
									substr2 = substr.substring(l - 4);
									if (substr2.equals(".mp4")) {
			%>
			<br>
			<h3>Video</h3>
			<video controls> <source
				src="file/<%=substr%>" type="video/mp4"></video>
			<%
				break;
									} else {
			%>
			<font size="5">Step<%=a%></font><img src="file/<%=substr%>"
			    >&nbsp&nbsp&nbsp&nbsp
			<%
				a++;
										break;
									}
								}

								k = j + 1;

							}
						}
						k = 0;

					}
				}
			%>


		</div>

		<div id="News" class="tabcontent3">
			<center>
				<h3>Restratvie Style</h3>
			</center>
			<p>Restorative yoga focuses on healing the body and mind. Through
				asana (body position), pranayama (breath work), meditation and
				relaxation techniques, you will learn to observe every sensation and
				thought, and to determine how well a pose (or a perspective) is
				serving you. An expression of deep self-inquiry, Kripalu is
				distinguished by an emphasis on bringing nonjudgmental awareness to
				physical sensations, emotions and thoughts. Yin looks at where we
				hold tightness in the body and helps release it. Gentle yoga is
				designed for increasing a sense of self and healing. All the classes
				consist of mostly seated positions with an emphasis on breath, an
				opening of the chest and hips, and on getting in tune with and
				releasing areas of tightness, mostly in the neck, wrists and
				shoulders.</p>

			<%
				for (Image st : li) {

					type = st.getType();
					name = st.getName();
					descrption = st.getDescrption();
					image = st.getImage();
					path = st.getPath();
					if (type.equals("restorative")) {
						out.println("<center><h1>" + name + "</h1></center>");
						int i = descrption.length();
						String substr = "";
						char ch;
						int k = 0;
						for (int j = 0; j < i; j++) {
							ch = descrption.charAt(j);
							if (ch == '.') {
								substr = descrption.substring(k, j);
			%>
			<%=substr%><br> <br>
			<%
				k = j + 1;
							}
						}
						k = 0;
						int z = image.length(), a = 1;
						for (int j = 0; j < z; j++) {
							ch = image.charAt(j);
							if (ch == '#') {
								String substr2 = "";
								substr = image.substring(k, j);
								int l = substr.length();
								for (int m = 0; m < l; m++) {
									substr2 = substr.substring(l - 4);
									if (substr2.equals(".mp4")) {
			%>
			<br>
			<h3>Video</h3>
			<video  controls> <source
				src="file/<%=substr%>" type="video/mp4"></video>
			<%
				break;
									} else {
			%>
			<font size="5">Step<%=a%></font><img src="file/<%=substr%>"
				>&nbsp&nbsp&nbsp&nbsp
			<%
				a++;
										break;
									}
								}

								k = j + 1;

							}
						}
						k = 0;

					}
				}
			%>


		</div>

		<div id="Contact" class="tabcontent3">
			<center>
				<h3>Alignment Style</h3>
			</center>
			<p>Alignment-focused yoga emphasizes precision positioning of all
				parts of the body, and micro-adjustments to achieve the full
				expression of each pose. This precision builds strength and stamina,
				balance and flexibility, and a sense of well-being. Certified
				Iyengar yoga instructors undergo rigorous training for a minimum of
				two years and cannot start that training unless they have had a
				practice for a minimum of three. (Other styles may require as little
				as six months of practice and nine weeks of teacher training.)
				During Iyengar yoga classes, you might complete only a few poses,
				taking extra time to master the proper alignment, and you will do
				restorative poses (like child pose) in between. Positions can be
				modified with props like ropes, straps and wooden blocks. Anusara,
				an offshoot of Iyengar, can be more playful. Both typically include
				storytelling, chanting and a theme that varies from class to class.
				Anusara means 'flowing with grace' and emphasizes uniting the
				physical with both the emotional and spiritual parts of ourselves.</p>

			<%
				for (Image st : li) {

					type = st.getType();
					name = st.getName();
					descrption = st.getDescrption();
					image = st.getImage();
					path = st.getPath();
					if (type.equals("alignment")) {
						out.println("<center><h1>" + name + "</h1></center>");
						int i = descrption.length();
						String substr = "";
						char ch;
						int k = 0;
						for (int j = 0; j < i; j++) {
							ch = descrption.charAt(j);
							if (ch == '.') {
								substr = descrption.substring(k, j);
			%>
			<%=substr%><br> <br>
			<%
				k = j + 1;
							}
						}
						k = 0;
						int z = image.length(), a = 1;
						for (int j = 0; j < z; j++) {
							ch = image.charAt(j);
							if (ch == '#') {
								String substr2 = "";
								substr = image.substring(k, j);
								int l = substr.length();
								for (int m = 0; m < l; m++) {
									substr2 = substr.substring(l - 4);
									if (substr2.equals(".mp4")) {
			%>
			<br>
			<h3>Video</h3>
			<video  controls> <source
				src="file/<%=substr%>" type="video/mp4"></video>
			<%
				break;
									} else {
			%>
			<font size="5">Step<%=a%></font><img src="file/<%=substr%>"
				>&nbsp&nbsp&nbsp&nbsp
			<%
				a++;
										break;
									}
								}

								k = j + 1;

							}
						}
						k = 0;

					}
				}
			%>


		</div>

		<div id="About" class="tabcontent3">
			<center>
				<h3>Heated Style</h3>
			</center>
			<p>'Heated yoga' describes any practice that is performed in a
				heated studio. The warmth promotes deeper stretching and creates
				cardiovascular challenge. Bikram, the first hot yoga introduced to
				Westerners, was developed by yoga guru Bikram Choudhury and follows
				a standard protocol: Rooms are heated to 105 degrees F and 40
				percent humidity, and classes consist of 45 minutes of standing
				poses and 45 minutes of floor postures. Other types of hot yoga
				follow slightly looser guidelines. In all cases, deep concentration
				is required, and the goal is to create a fit, fluid body and mind.</p>

			<%
				for (Image st : li) {

					type = st.getType();
					name = st.getName();
					descrption = st.getDescrption();
					image = st.getImage();
					path = st.getPath();
					if (type.equals("heated")) {
						out.println("<center><h1>" + name + "</h1></center>");
						int i = descrption.length();
						String substr = "";
						char ch;
						int k = 0;
						for (int j = 0; j < i; j++) {
							ch = descrption.charAt(j);
							if (ch == '.') {
								substr = descrption.substring(k, j);
			%>
			<%=substr%><br> <br>
			<%
				k = j + 1;
							}
						}
						k = 0;
						int z = image.length(), a = 1;
						for (int j = 0; j < z; j++) {
							ch = image.charAt(j);
							if (ch == '#') {
								String substr2 = "";
								substr = image.substring(k, j);
								int l = substr.length();
								for (int m = 0; m < l; m++) {
									substr2 = substr.substring(l - 4);
									if (substr2.equals(".mp4")) {
			%>
			<br>
			<h3>Video</h3>
			<video  controls> <source
				src="file/<%=substr%>" type="video/mp4"></video>
			<%
				break;
									} else {
			%>
			<font size="5">Step<%=a%></font><img src="file/<%=substr%>"
				>&nbsp&nbsp&nbsp&nbsp
			<%
				a++;
										break;
									}
								}

								k = j + 1;

							}
						}
						k = 0;

					}
				}
			%>


		</div>



	</div>

	<div id="Tokyo" class="tabcontent">


		<div class="help">
			<center>
				<h3>Tips for beginner in Gym</h3>
			</center>
			1)Using too much weight, too soon; always start lower than your
			expected ability and work your way up that first workout. If your
			form suffers, you are swinging the weight, or using momentum, this
			indicates you may be using too much weight. Greater momentum
			increases the potential for injury and reduces the effectiveness to
			the muscle group being targeted.
		</div>
		<br>
		<div class="help">2)Not using enough weight; always play it
			safe, but if you can perform 30 reps with a certain weight, it's
			likely time to increase it a bit. Tip: Increase the weight no more
			than about 5% at a time.</div>
		<br>
		<div class="help">3)Moving through repetitions too quickly,
			going too fast; there is nothing gained by lifting weights fast. Some
			of the perks of lifting weight in a slow and controlled manner,
			include more total muscle tension and force produced, more
			muscle-fiber activation both slow and fast twitch fibers, and less
			tissue trauma. Remember, a joint is only as strong as the muscles
			that cross it; if you haven't lifted in a long time, or ever, be
			careful what you ask of your joints.</div>
		<br>
		<div class="help">4)Not resting long enough, or resting far too
			long; both can be a workout killer. Tip: The recommended rest period
			is between 30-90 seconds, for overall fitness.</div>
		<br> <br>

		<div class="help">
			<center>
				<h3>Tips for Beginner for Yoga</h3>
			</center>
			<h3>1. Make space in your home:</h3>
			By practicing in the same place at home you create a groove in your
			mind the memory of past days’ experiences makes it easier to begin
			today. Store props nearby so that getting started doesn’t require a
			lot of running around. An inspiring image or statue, an Oriental
			carpet, or a specially selected cushion can mark this place as
			special.
		</div>
		<br>
		<div class="help">
			<h3>2. Define your practice:</h3>
			The practice routine you create depends a good deal on you. Define
			the time you have available for practice, the technique you would
			like to focus on, and the balance among meditation, breathing, and
			asana practices. Then consider the details. Are you clear about the
			order of your practice and the methods you are using? Are there
			aspects of an asana that need attention or that intrigue you? If a
			posture or any other practice seems too difficult, could you break it
			down, or prepare for it with less challenging techniques? What are
			the steps in the relaxation or meditation methods you have learned?
			If you have questions, make sure to ask your teacher for help.
		</div>
		<br>

		<div class="help">
			<h3>3.Balance the postures with relaxation/meditation:</h3>
			These days most yoga classes heavily emphasize asana practice. Some
			teachers may not include relaxation or meditation in the class
			routine at all. But don’t neglect them. You need to relax; it will
			help you feel better; and once you have begun to relax or meditate
			regularly, the experience will transform you. Many students are
			attracted to yoga primarily in order to meditate; others are focused
			on physical health and are not aware of the importance of meditation.
			Working with the body or mind alone is usually not enough to create
			the inner strength and equilibrium we hope for. A balanced
			combination of asana practice and mental centering will engender a
			sense of well-being.
		</div>



	</div>

	<script>
		function openCity(evt, cityName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " active";
		}

		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();

		function openCity1(evt, cityName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent1");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks1");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " active";

		}
		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen4").click();

		function openPage(pageName, elmnt, color) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent3");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablink3");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].style.backgroundColor = "";
			}
			document.getElementById(pageName).style.display = "block";
			elmnt.style.backgroundColor = color;

		}
		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen3").click();
	</script>

</body>
</html>