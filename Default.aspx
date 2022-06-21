<%@ Page Title="Список задач" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ToDoListApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p />
    <div>
        <asp:GridView ID="dataGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ToDoListDataSource" RowStyle-HorizontalAlign="Center" HorizontalAlign="Center" Width="780px">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                <asp:BoundField DataField="Описание_задачи" HeaderText="Описание задачи" SortExpression="Описание_задачи" />
                <asp:CheckBoxField DataField="Статус" HeaderText="Статус" SortExpression="Статус" />
                <asp:CommandField EditText="Редактировать" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Сохранить изменения" ButtonType="Button" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="ToDoListDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ToDoListConnectionString %>" DeleteCommand="DELETE FROM [ToDoListTable] WHERE [ID] = @ID" InsertCommand="INSERT INTO [ToDoListTable] ([Описание задачи], [Статус]) VALUES (@Описание_задачи, @Статус)" SelectCommand="SELECT [ID], [Описание задачи] AS Описание_задачи, [Статус] AS Статус FROM [ToDoListTable]" UpdateCommand="UPDATE [ToDoListTable] SET [Описание задачи] = @Описание_задачи, [Статус] = @Статус WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Описание_задачи" Type="String" />
                <asp:Parameter Name="Статус" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Описание_задачи" Type="String" />
                <asp:Parameter Name="Статус" Type="Boolean" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    <div>
        <p />
        <div>
            Описание задачи
            <p><asp:TextBox ID="taskDescriptionTextBox" runat="server" ToolTip="Поле описания задачи" Height="40px" Width="250px" /></p>
        </div>

        <div>
            Статус
            <p>&nbsp;&nbsp;&nbsp;<asp:CheckBox runat="server" ID="statusCheckBox" /></p>
        </div>

        <asp:Button ID="addTaskButton" runat="server" Text="Добавить новую задачу" OnClick="addTaskButton_Click" />
    </div>
</asp:Content>
