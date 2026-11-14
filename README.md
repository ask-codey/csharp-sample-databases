# C# Full-Stack Bootcamp: sample databases

The databases used in the C# Full-Stack Bootcamp on [ask-codey.com](https://www.ask-codey.com). The lesson **SQL Server Management Studio** walks through creating each one.

| Database | What it holds | How to create it |
|---|---|---|
| **Northwind** | A small food-trading company: customers, orders, products, suppliers, employees | Open `Northwind.sql` in SSMS and run it |
| **BooksPlus** | A bookstore chain: books, authors, publishers, stores, customers and orders | Open `BooksPlus.sql` in SSMS and run it |
| **AdventureWorksLT** | A bicycle company: products, categories, customers, sales orders | Restore Microsoft's backup (below) |

**Running `Northwind.sql` or `BooksPlus.sql` deletes any database of the same name and creates it again**, with the original data. That's handy if you ever want to start fresh.

## AdventureWorksLT

Download `AdventureWorksLT2022.bak` from Microsoft:

```text
https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksLT2022.bak
```

1. Copy the file into SQL Server's backup folder: `C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\Backup`. Windows asks for permission; click **Continue**. (SQL Server can't read files in your own Downloads folder.)
2. In SSMS, right-click **Databases** and choose **Restore Database...**.
3. Choose **Device**, click **...**, then **Add**, and pick `AdventureWorksLT2022.bak`. Click **OK** twice.
4. Click **OK** to restore. The database appears as **AdventureWorksLT2022**.

## The views scripts

`Northwind_Views.sql` and `AdventureWorksLT_Views.sql` create a few views used later in the course, in the Views, Stored Procedures and Functions chapter. You don't need them until then.

## Where they come from

- **Northwind** is Microsoft's classic sample database (Copyright Microsoft, from the [SQL Server samples](https://github.com/microsoft/sql-server-samples), MIT license), changed for this course: the `"Order Details"` table is named `OrderDetails`, so its name needs no quotes or brackets.
- **AdventureWorksLT** is Microsoft's, downloaded from the same project.
- **BooksPlus** was made for this course. Every person, address and email in it is made up.
