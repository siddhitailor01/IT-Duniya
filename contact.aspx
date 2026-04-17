<%@ Page Title="Contact IT Duniya | Get Expert Programming Help & IT Mentoring in Bhilwara" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="description" content="Have a technical query or need help with your BCA/BSc-IT project? Contact IT Duniya in Bhilwara for expert programming support, error solutions, and IT career mentoring." />
    <meta name="keywords" content="Contact IT Duniya, Bhilwara IT Support, Programming Mentoring Rajasthan, BCA Project Help, MERN Stack Support, .NET Error Solutions, IT Duniya Phone Number" />
    <meta name="author" content="IT Duniya" />
    <meta name="robots" content="index, follow" />

    <meta property="og:title" content="Contact IT Duniya - We're Here to Solve Your Technical Problems" />
    <meta property="og:description" content="Reach out to Bhilwara's premier IT education hub for project guidance and technical support." />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="https://www.itduniya.in/contact.aspx" />
    <meta property="og:image" content="https://www.itduniya.in/assets/images/contact-share.jpg" />

    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        :root {
            --navy-deep: #003a4d; /* Image Teal */
            --cyan-accent: #00c4cc; /* Image Cyan */
            --bg-gray: #f4f7f6;   /* Depth Gray */
            --text-muted: #64748b;
        }

        body { background-color: #ffffff; }

        /* --- Premium Contact Header with Image Overlay --- */
        .contact-header {
            background: linear-gradient(rgba(0, 43, 69, 0.7), rgba(0, 43, 69, 0.7)), 
                        url('assets/images/contact.jpg');
            background-size: cover;
            background-position: center;
            padding: 50px 0;
            color: #ffffff;
            border-bottom: 4px solid var(--cyan-accent); /* Execoore Cyan Accent */
        }

        .contact-header .breadcrumb-tag {
            font-size: 11px; font-weight: 800; color: var(--cyan-accent); text-transform: uppercase; letter-spacing: 2px; display: block; margin-bottom: 15px;
        }

        .contact-header h1 {
            font-size: 3rem; font-weight: 800; text-transform: uppercase; letter-spacing: 1px; margin: 0;
        }

        /* --- Form Section --- */
        .section-title-sm { 
            font-size: 11px; font-weight: 800; color: var(--cyan-accent); 
            text-transform: uppercase; letter-spacing: 2px; display: block; margin-bottom: 10px;
        }
        .section-title-lg { 
            color: var(--navy-deep); font-weight: 800; font-size: 2rem; margin-bottom: 40px; 
        }

        /* Minimalist Inputs */
        .form-label-custom { font-size: 13px; font-weight: 700; color: var(--navy-deep); margin-bottom: 8px; }
        .form-control-custom {
            border: none; border-bottom: 1px solid #e2e8f0; border-radius: 0;
            padding: 12px 0; font-size: 14px; background: transparent; transition: 0.3s;
        }
        .form-control-custom:focus {
            box-shadow: none; border-bottom-color: var(--cyan-accent); outline: none;
        }

        /* --- Information Box --- */
        .info-card-premium {
            background: #ffffff; padding: 40px; border-radius: 4px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.05); border-top: 4px solid var(--navy-deep);
        }
        .contact-detail-row {
            display: flex; justify-content: space-between; align-items: center;
            padding: 15px 0; border-bottom: 1px dotted #cbd5e1;
        }
        .contact-detail-row:last-child { border: none; }
        .detail-label { font-weight: 800; font-size: 13px; color: var(--navy-deep); }
        .detail-value { font-size: 13px; color: var(--text-muted); text-align: right; }

        .social-square {
            width: 38px; height: 38px; background: var(--navy-deep); color: white;
            display: inline-flex; align-items: center; justify-content: center;
            border-radius: 3px; margin-right: 8px; transition: 0.3s; text-decoration: none;
        }
        .social-square:hover { background: var(--cyan-accent); transform: translateY(-3px); color: white; }

        .btn-startup {
            background-color: var(--cyan-accent); color: white;
            font-weight: 800; font-size: 12px; letter-spacing: 1px;
            padding: 15px 40px; border: none; border-radius: 2px; transition: 0.4s;
        }
        .btn-startup:hover { background-color: var(--navy-deep); box-shadow: 0 10px 20px rgba(0,196,204,0.2); }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <section class="contact-header">
    <div class="container" data-aos="fade-down">
        <span class="breadcrumb-tag">Home / Contact</span>
        <h1>CONTACT US</h1>
    </div>
</section>

    <div class="container my-5 py-5">
        <div class="row g-lg-5">
            <div class="col-lg-7" data-aos="fade-right">
                <span class="section-title-sm">Write Us</span>
                <h2 class="section-title-lg">Contact us here</h2>
                
                <div class="row g-4">
                    <div class="col-md-6">
                        <label class="form-label-custom">Name</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control form-control-custom" placeholder="Your name"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label-custom">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control form-control-custom" placeholder="Email address"></asp:TextBox>
                    </div>
                    <div class="col-md-12">
                        <label class="form-label-custom">Subject</label>
                        <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control form-control-custom" placeholder="How can we help?"></asp:TextBox>
                    </div>
                    <div class="col-md-12">
                        <label class="form-label-custom">Message</label>
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control form-control-custom" placeholder="Write your message..."></asp:TextBox>
                    </div>
                    <div class="col-md-12 pt-4">
                        <asp:Button ID="btnSendMessage" runat="server" Text="SEND MESSAGE" OnClick="btnSendMessage_Click" CssClass="btn-startup" />
                    </div>
                </div>
            </div>

            <div class="col-lg-5 mt-5 mt-lg-0" data-aos="fade-left">
                <span class="section-title-sm">Information</span>
                <h2 class="section-title-lg">Our contacts</h2>

                <div class="info-card-premium">
                    <div class="contact-detail-row">
                        <span class="detail-label">Address</span>
                        <span class="detail-value">Bhilwara, Rajasthan, India</span>
                    </div>
                    <div class="contact-detail-row">
                        <span class="detail-label">Email</span>
                        <span class="detail-value"><a href="mailto:support@itduniya.in" class="text-decoration-none text-muted">support@itduniya.in</a></span>
                    </div>
                    <div class="contact-detail-row">
                        <span class="detail-label">Phone</span>
                        <span class="detail-value"><a href="tel:+919610229171" class="text-decoration-none text-muted">+91 96102 29171</a></span>
                    </div>
                    <div class="contact-detail-row">
                        <span class="detail-label">Instagram</span>
                        <span class="detail-value">@hiddenvlogerr</span>
                    </div>

                    <div class="mt-4 pt-2">
                        <a href="#" class="social-square"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social-square"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="social-square"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="social-square"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>

                <div class="mt-5 p-4 border-start border-4" style="border-color:var(--cyan-accent) !important; background:var(--bg-gray);">
                    <h6 class="fw-bold text-dark mb-2">Technical Guidance</h6>
                    <p class="text-muted small mb-0">For college projects or error solutions, please mention your Tech-Stack (e.g., MERN, .NET, C++) clearly in the subject.</p>
                </div>
            </div>
        </div>
    </div>

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>AOS.init({ duration: 1000, once: true });</script>
    <script type="text/javascript">
        window.onpageshow = function (event) {
            // Browser ki navigation history check karein
            var perfEntries = performance.getEntriesByType("navigation");

            if (perfEntries.length > 0) {
                var navType = perfEntries[0].type;

                // 'reload' = F5 (Refresh)
                // 'back_forward' = Back Button se aana
                if (navType === 'reload' || navType === 'back_forward' || event.persisted) {

                    // Sabhi fields ki IDs ko target karein
                    var fields = [
                        '<%= txtName.ClientID %>',
                    '<%= txtEmail.ClientID %>',
                    '<%= txtSubject.ClientID %>',
                    '<%= txtMessage.ClientID %>'
                ];

                fields.forEach(function (id) {
                    var element = document.getElementById(id);
                    if (element) {
                        element.value = ""; // Field khali karein
                    }
                });
            }
        }
    };
</script>
</asp:Content>