/* Q1- Retrive Name and Phone Number of the Employees 
	   who work as Tailors
*/
select name , phone
from Employee
where TypeOfEmployee = 'Tailor';



/* Q2- Retrieve Sum of Employees Salaries for each Department */
select d.name,sum(e.salary) as 'Sum of Employees Salaries'
from Employee e join Department d
on e.Department_number = d.number
group by d.name;



/* Q3- Retrieve the name of each factory and how many branches
	   it has
*/
select f.name,count(b.number) as 'Number of Branches'
from Factory f , Branches b
where b.Factory_name = f.name
group by f.name;

/* Q4
retrieve the cost for working a year for financialStudyId=2930
*/
Select (FactoryRent+electrictyBill+AdverstingExpenses+ReularMaintainceWork+WagesAndSalaries)*12 AS CostForYear
From financialstudy
Where StudyID="2930";

/* Q5
retrieve the maximun department that has the maximun employee
*/
Select d.name, Count(e.Department_Number) AS CountDep
From Employee e,Department d
Where e.Department_Number=d.number
Group by e.Department_Number
Having CountDep= (Select max(x.countDep)AS MaxDep From (Select Count(Department_Number)AS countDep From employee group by Department_Number)x);

/* Q6
retrieve how many clients that every salesRepresentative deal with
*/
select max(x.MostSales),SalesRepresentative_employee_ssn
From (SELECT Count(SalesRepresentative_employee_ssn) AS MostSales ,SalesRepresentative_employee_ssn FROM dealwith GROUP BY SalesRepresentative_employee_ssn)x
GROUP BY SalesRepresentative_employee_ssn;

/* Q7
retrieve the maximun product sold and their name
*/
Select E.Product_id,P.name
FROM exports E,product P
WHERE E.Product_id=P.id AND noOfProductSold= (SELECT MAX(noOfProductSold) FROM exports);

/* Q8
Retrieve Owner HAs Max branches for specific factory
*/
Select F.owner,Count(Factory_name) AS CountFact
From factory F,branches B
Where B.Factory_name=F.name
GROUP by Factory_name
Having CountFact=(
Select Max(x.CountFact) From 
(Select Count(Factory_name) AS CountFact From factory F,branches B Where B.Factory_name=F.name  GROUP BY Factory_name)x
);

/* Q9
ااستعلام يشير الى الفرق بين التدفقات المالية الداخلة للمشروع والتكاليف الناتجة عنه
*/
 SELECT (Select theCurrentCapital+WagesAndSalaries+electrictyBill+AdverstingExpenses+ReularMaintainceWork+investmentsCosts+FactoryRent FROM financialstudy f Where f.StudyID="2930") -(select SUM(e.noOfProductSold*p.price)FROM exports e,shops s,marketingstudy m,product p Where m.StudyID=s.MarketingStudy_StudyID AND e.Shops_Number=s.Number AND m.StudyID="2526" AND e.Product_id=p.id);

 
 /* Q10
حاصل قسمة التدفقات النقدية للمشروع على صافى القيمة الحالية
*/
SELECT(
(select SUM(e.noOfProductSold*p.price)FROM exports e,shops s,marketingstudy m,product p Where m.StudyID=s.MarketingStudy_StudyID AND e.Shops_Number=s.Number AND m.StudyID="2526" AND e.Product_id=p.id)
/ 
(
(Select theCurrentCapital+WagesAndSalaries+electrictyBill+AdverstingExpenses+ReularMaintainceWork+investmentsCosts+FactoryRent FROM financialstudy f Where f.StudyID="2930")
 -
(select SUM(e.noOfProductSold*p.price)FROM exports e,shops s,marketingstudy m,product p Where m.StudyID=s.MarketingStudy_StudyID AND e.Shops_Number=s.Number AND m.StudyID="2526" AND e.Product_id=p.id)
)
) As ProfitAnalysis;

/* Q11
retrieve the maximun SalesRepresentative tha deal with the max clients
 */
select D.SalesRepresentative_employee_ssn,Count(D.SalesRepresentative_employee_ssn) AS noOfSales
FROM dealWith D,salesrepresentative S
WHERE D.SalesRepresentative_employee_ssn=S.employee_ssn 
GROUP BY D.SalesRepresentative_employee_ssn
 HAVING  noOfSales=(select max(x.MostSales)
From (SELECT Count(SalesRepresentative_employee_ssn) AS MostSales  FROM dealWith GROUP BY SalesRepresentative_employee_ssn)x); 








