<%@ Page Title="Llenar Encuesta" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="LlenarEncuesta.aspx.cs" Inherits="Examen3_Joseph.LlenarEncuesta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 50%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        select {
            width: calc(100% - 12px);
            padding: 6px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="text"]:focus,
        select:focus {
            outline: none;
            border-color: #66afe9;
        }

        .btn-agregar {
            background-color: #428bca;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-agregar:hover {
            background-color: #3071a9;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2>Llenar Encuesta</h2>
        <div class="form-group">
            <label for="txtNombre">Nombre:</label>
            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNombre" ControlToValidate="txtNombre" ErrorMessage="Nombre es obligatorio" runat="server" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="txtEdad">Edad:</label>
            <asp:TextBox ID="txtEdad" runat="server" type="number"></asp:TextBox>
            <asp:RangeValidator ID="rvEdad" ControlToValidate="txtEdad" ErrorMessage="Edad debe estar entre 18 y 50" MinimumValue="18" MaximumValue="50" Type="Integer" runat="server" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="txtCorreo">Correo Electrónico:</label>
            <asp:TextBox ID="txtCorreo" runat="server" type="email"></asp:TextBox>
            <asp:RegularExpressionValidator ID="revCorreo" ControlToValidate="txtCorreo" ErrorMessage="Formato de correo inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="ddlPartidosPoliticos">Partido Político:</label>
            <asp:DropDownList ID="ddlPartidosPoliticos" runat="server">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvPartidoPolitico" ControlToValidate="ddlPartidosPoliticos" ErrorMessage="Debe seleccionar un partido político" InitialValue="0" runat="server" ForeColor="Red" />
        </div>
        <asp:Button ID="btnAgregar" runat="server" Text="Agregar Encuesta" CssClass="btn-agregar" OnClick="btnAgregar_Click" />
    </div>
    <div>
        <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
