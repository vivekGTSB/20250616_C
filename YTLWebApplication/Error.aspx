<%@ Page Language="VB" AutoEventWireup="false" CodeBehind="Error.aspx.vb" Inherits="YTLWebApplication.ErrorPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error - YTL Fleet Management</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="robots" content="noindex, nofollow" />
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        .error-container {
            max-width: 600px;
            margin: 100px auto;
            background: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .error-icon {
            font-size: 48px;
            color: #d32f2f;
            margin-bottom: 20px;
        }
        .error-title {
            font-size: 24px;
            color: #333;
            margin-bottom: 15px;
        }
        .error-message {
            font-size: 16px;
            color: #666;
            margin-bottom: 30px;
            line-height: 1.5;
        }
        .back-button {
            display: inline-block;
            padding: 12px 24px;
            background-color: #465ae8;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .back-button:hover {
            background-color: #3a4bc8;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="error-container">
            <div class="error-icon">⚠</div>
            <h1 class="error-title">An Error Occurred</h1>
            <p class="error-message">
                We're sorry, but an unexpected error has occurred. 
                The error has been logged and our technical team has been notified.
            </p>
            <a href="~/Login.aspx" class="back-button" runat="server">Return to Login</a>
        </div>
    </form>
</body>
</html>