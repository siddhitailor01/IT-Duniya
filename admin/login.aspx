<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="admin_login" %>

<!DOCTYPE html>
<html lang="hi">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Login - itduniya.in</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <style>
        :root {
            --bg-deep: #111827; /* Dark Slate */
            --accent: #00c4cc;   /* ITDuniya Cyan */
            --card-bg: #ffffff;
        }

        body { 
            font-family: 'Inter', sans-serif; 
            background: linear-gradient(135deg, var(--bg-deep) 0%, #1f2937 100%); 
            height: 100vh; 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            margin: 0;
        }

        .login-card { 
            background: var(--card-bg);
            border-radius: 24px; 
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5); 
            border: none; 
            width: 100%; 
            max-width: 420px; 
            padding: 40px;
            position: relative;
            overflow: hidden;
        }

        /* Accent top bar */
        .login-card::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0;
            height: 5px;
            background: var(--accent);
        }

        .brand-logo { text-align: center; margin-bottom: 35px; }
        .brand-logo h2 { 
            color: var(--bg-deep); 
            font-weight: 800; 
            letter-spacing: -1px; 
            margin: 0;
            font-size: 2rem;
        }
        .brand-logo h2 span { color: var(--accent); }
        .brand-logo p { font-size: 13px; font-weight: 600; color: #6b7280; text-transform: uppercase; letter-spacing: 1px; }

        .form-label { font-size: 13px; font-weight: 700; color: #374151; margin-bottom: 8px; }
        
        .input-group-text { 
            background: #f9fafb; 
            border: 1px solid #e5e7eb; 
            border-right: none; 
            color: #9ca3af; 
            border-radius: 12px 0 0 12px;
        }

        .form-control { 
            background: #f9fafb;
            border: 1px solid #e5e7eb; 
            padding: 12px 15px; 
            font-size: 14px;
            border-radius: 0 12px 12px 0;
            transition: 0.3s;
        }

        .form-control:focus { 
            background: #fff;
            border-color: var(--accent); 
            box-shadow: 0 0 0 4px rgba(0, 196, 204, 0.1); 
            outline: none;
        }

        .btn-login { 
            background: var(--bg-deep); 
            color: #fff; 
            border: none;
            border-radius: 12px; 
            padding: 14px; 
            font-size: 15px;
            font-weight: 700; 
            width: 100%; 
            transition: 0.3s; 
            margin-top: 10px;
        }

        .btn-login:hover { 
            background: var(--accent); 
            color: #fff;
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(0, 196, 204, 0.3);
        }

        .back-link { 
            display: inline-block; 
            margin-top: 25px; 
            font-size: 13px; 
            font-weight: 600; 
            color: #6b7280; 
            text-decoration: none; 
            transition: 0.2s;
        }
        .back-link:hover { color: var(--accent); }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-card">
            <div class="brand-logo">
                <h2>IT<span>DUNIYA</span></h2>
                <p>System Administration</p>
            </div>

            <div class="mb-3">
                <label class="form-label">Admin Username</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fa-solid fa-user-shield"></i></span>
                    <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" placeholder="Admin ID dalein"></asp:TextBox>
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label">Secret Password</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fa-solid fa-lock"></i></span>
                    <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" TextMode="Password" placeholder="••••••••"></asp:TextBox>
                </div>
            </div>

            <asp:Label ID="lblError" runat="server" CssClass="text-danger small mb-3 d-block text-center fw-bold"></asp:Label>
            
            <asp:Button ID="btnLogin" runat="server" Text="AUTHORIZE LOGIN" OnClick="btnLogin_Click" CssClass="btn btn-login" />

            <div class="text-center">
                <a href="../index.aspx" class="back-link">
                    <i class="fa-solid fa-arrow-left-long me-1"></i> Public Website Par Jayein
                </a>
            </div>
        </div>
    </form>
</body>
</html>