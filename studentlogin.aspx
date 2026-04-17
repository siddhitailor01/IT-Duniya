<%@ Page Title="Student Login | Access Your IT Learning Dashboard - IT Duniya" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="studentlogin.aspx.cs" Inherits="studentlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="description" content="Securely login to the IT Duniya Student Portal. Access your personalized dashboard for BCA, BSc-IT notes, programming tutorials, and project tracking." />
    <meta name="keywords" content="Student Login, IT Duniya Portal, BCA Student Dashboard, BSc-IT Learning Portal, Secure OTP Login, IT Education Bhilwara" />
    <meta name="author" content="IT Duniya" />
    <meta name="robots" content="index, follow" />

    <meta property="og:title" content="Student Login - IT Duniya Portal" />
    <meta property="og:description" content="Access your coding notes and tutorials in one secure place." />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="https://www.itduniya.in/studentlogin.aspx" />

    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        :root {
            --navy-deep: #003a4d;
            --cyan-accent: #00c4cc;
            --bg-gray: #f4f7f6;
            --text-muted: #64748b;
        }

        body { background-color: var(--bg-gray); }

        /* --- Login Container --- */
        .login-wrapper { 
            min-height: 80vh; 
            display: flex; 
            align-items: center; 
            padding: 60px 0;
        }

        .login-card-premium {
            background: #ffffff;
            padding: 50px 40px;
            max-width: 450px;
            width: 100%;
            margin: 0 auto;
            border-radius: 4px;
            box-shadow: 0 30px 60px rgba(0,0,0,0.05);
            border-top: 5px solid var(--navy-deep);
            position: relative;
        }

        /* --- Typography --- */
        .login-title {
            font-size: 1.5rem;
            font-weight: 800;
            color: var(--navy-deep);
            text-transform: uppercase;
            letter-spacing: -0.5px;
            margin-bottom: 10px;
            text-align: center;
        }
        .login-subtitle {
            font-size: 11px;
            font-weight: 800;
            color: var(--cyan-accent);
            text-transform: uppercase;
            letter-spacing: 2px;
            display: block;
            text-align: center;
            margin-bottom: 40px;
        }

        /* --- Minimalist Form Controls --- */
        .form-label-tech {
            font-size: 11px;
            font-weight: 800;
            color: var(--navy-deep);
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 10px;
            display: block;
        }
        .form-control-tech {
            border: none;
            border-bottom: 1px solid #e2e8f0;
            border-radius: 0;
            padding: 12px 0;
            font-size: 14px;
            background: transparent;
            transition: 0.3s;
        }
        .form-control-tech:focus {
            box-shadow: none;
            border-bottom-color: var(--cyan-accent);
            outline: none;
        }

        /* --- Premium Buttons --- */
        .btn-startup {
            background-color: var(--cyan-accent);
            color: white;
            font-weight: 800;
            font-size: 12px;
            letter-spacing: 1px;
            padding: 15px;
            border: none;
            border-radius: 2px;
            transition: 0.4s;
            text-transform: uppercase;
            margin-top: 20px;
        }
        .btn-startup:hover {
            background-color: var(--navy-deep);
            color:#fff;
            box-shadow: 0 10px 20px rgba(0,196,204,0.2);
        }

        /* OTP Alert box */
        .otp-notice {
            background: #f0fdf4;
            border-left: 3px solid #22c55e;
            padding: 12px 15px;
            font-size: 12px;
            color: #166534;
            margin-bottom: 25px;
            font-weight: 600;
        }

        .back-link {
            font-size: 11px;
            font-weight: 800;
            color: var(--text-muted);
            text-decoration: none;
            text-transform: uppercase;
            display: block;
            text-align: center;
            margin-top: 25px;
            transition: 0.3s;
        }
        .back-link:hover { color: var(--navy-deep); }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="login-wrapper">
        <div class="container">
            <div class="login-card-premium" data-aos="zoom-in">
                <span class="login-subtitle">Student Portal Access</span>
                <h3 class="login-title">LOGIN TO <span>DASHBOARD</span></h3>
                
                <asp:Panel ID="pnlEmail" runat="server">
                    <div class="mb-4 mt-4">
<%--                        <label class="form-label-tech">Registered Email Address</label>--%>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control form-control-tech" placeholder="Enter your email"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnSendOTP" runat="server" Text="GET AUTHENTICATION OTP" OnClick="btnSendOTP_Click" CssClass="btn btn-startup w-100" />
                    
                    <div class="mt-4 pt-3 border-top text-center">
                        <p class="text-muted small mb-0">Don't have access? Connect with admin.</p>
                    </div>
                </asp:Panel>

                <asp:Panel ID="pnlOTP" runat="server" Visible="false">
                    <div class="otp-notice">
                        <i class="fas fa-check-circle me-2"></i> Secure OTP has been sent to your email.
                    </div>
                    <div class="mb-4">
                        <label class="form-label-tech">Enter 6-Digit OTP</label>
                        <asp:TextBox ID="txtOTP" runat="server" CssClass="form-control form-control-tech text-center fw-bold" MaxLength="6" placeholder="· · · · · ·" style="font-size: 1.5rem; letter-spacing: 10px;"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnVerifyOTP" runat="server" Text="VERIFY & SECURE LOGIN" OnClick="btnVerifyOTP_Click" CssClass="btn btn-startup w-100" style="background-color: #22c55e;" />
                    
                    <asp:LinkButton ID="btnResend" runat="server" OnClick="btnBack_Click" CssClass="back-link">
                        <i class="fas fa-chevron-left me-1"></i> Use a different email?
                    </asp:LinkButton>
                </asp:Panel>
            </div>
        </div>
    </div>

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>AOS.init({ duration: 1000, once: true });</script>
</asp:Content>