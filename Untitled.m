conn = database.ODBCConnection('test','','');
sqlquery = 'select * from student';
curs = exec(conn,sqlquery);
curs = fetch(curs);
curs.Data
colnames = {'StdName', 'Subject_ID','Semester','Date','Status'};
 exdata = {'x',3, 2, '2019-07-02', 'Present'};
            insert(conn, 'student', colnames, exdata);
            
 conn = database.ODBCConnection('test','','');
sqlquery = 'select * from student';
curs = exec(conn,sqlquery);
curs = fetch(curs);
curs.Data 
colnames = {'StdName', 'Subject_ID','Semester','Date','Status'};
% switch(Recognized_index)
%     case Recognized_index
        
         if(Recognized_index==1)
           % {'x',3, 2, '2019-07-02', 'Present'};
            exdata = {'Baki',3201, 2, '2019-07-02', 'Present'};
            insert(conn, 'student', colnames, exdata);
            display('Baki is present')
        else
            exdata = {'Baki',3201, 2, '2019-07-02', 'absent'};
            insert(conn, 'student', colnames, exdata);
            display('baki is absent')
            end
         
        
           if(Recognized_index==2)
            exdata = {'Rakib',3201, 2, '2019-07-02', 'Present'};
            insert(conn, 'student', colnames, exdata);
            display('Rakib is present')
             else
            exdata = {'Rakib',3201, 2, '2019-07-02', 'absent'};
            insert(conn, 'student', colnames, exdata);
            display('Rakib is absent')
           end
       
            if(Recognized_index==3)
            exdata = {'Easan',3201, 2, '2019-07-02', 'Present'};
            insert(conn, 'student', colnames, exdata);
            display('Esan is present') 
             else
            exdata = {'Esan',3201, 2, '2019-07-02', 'absent'};
            insert(conn, 'student', colnames, exdata);
            display('Esan is absent')
        end  
         
       
            if(Recognized_index==4)
            exdata = {'Delowar',3201, 2, '2019-07-02', 'Present'};
            insert(conn, 'student', colnames, exdata);
            display('Md Delowar Hossain is present') 
             else
            exdata = {'Delowar',3201, 2, '2019-07-02', 'absent'};
            insert(conn, 'student', colnames, exdata);
            display('Delowwar is absent')
        end  
       
                    if(Recognized_index==5)
            exdata = {'Raihan',3201, 2, '2019-07-02', 'Present'};
            insert(conn, 'student', colnames, exdata);
            display('Md Raihan Hossain is present') 
             else
            exdata = {'Raihan',3201, 2, '2019-07-02', 'absent'};
            insert(conn, 'student', colnames, exdata);
            display('Raihan is absent')
                    end   
end
