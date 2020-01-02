function OutputName = Recognition(TestImage, m, A, Eigenfaces)
% Recognizing step....
%
% Description: This function compares two faces by projecting the images into facespace and 
% measuring the Euclidean distance between them.
%
% Argument:      TestImage              - Path of the input test image
%
%                m                      - (M*Nx1) Mean of the training
%                                         database, which is output of 'EigenfaceCore' function.
%
%                Eigenfaces             - (M*Nx(P-1)) Eigen vectors of the
%                                         covariance matrix of the training
%                                         database, which is output of 'EigenfaceCore' function.
%
%                A                      - (M*NxP) Matrix of centered image
%                                         vectors, which is output of 'EigenfaceCore' function.
% 
% Returns:       OutputName             - Name of the recognized image in the training database.
%
% See also: RESHAPE, STRCAT

% Original version by Amir Hossein Omidvarnia, October 2007
%                     Email: aomidvar@ece.ut.ac.ir                  

%%%%%%%%%%%%%%%%%%%%%%%% Projecting centered image vectors into facespace
% All centered images are projected into facespace by multiplying in
% Eigenface basis's. Projected vector of each face will be its corresponding
% feature vector.

ProjectedImages = [];
Train_Number = size(Eigenfaces,2);
for i = 1 : Train_Number
    temp = Eigenfaces'*A(:,i); % Projection of centered images into facespace
    ProjectedImages = [ProjectedImages temp]; 
end

%%%%%%%%%%%%%%%%%%%%%%%% Extracting the PCA features from test image
InputImage = imread(TestImage);
temp = InputImage(:,:,1);

[irow, icol] = size(temp);
InImage = reshape(temp',irow*icol,1);
Difference = double(InImage)-m; % Centered test image
ProjectedTestImage = Eigenfaces'*Difference; % Test image feature vector

%%%%%%%%%%%%%%%%%%%%%%%% Calculating Euclidean distances 
% Euclidean distances between the projected test image and the projection
% of all centered training images are calculated. Test image is
% supposed to have minimum distance with its corresponding image in the
% training database.

Euc_dist = [];
for i = 1 : Train_Number
    q = ProjectedImages(:,i);
    temp = ( norm( ProjectedTestImage - q ) )^2;
    Euc_dist = [Euc_dist temp];
end

[Euc_dist_min , Recognized_index] = min(Euc_dist);
% a= Recognized_index
%result(a)
%Recognized_index=a;

%----------------------------------------------

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
            exdata = {'Pobitra',3201, 2, '2019-07-02', 'Present'};
            insert(conn, 'student', colnames, exdata);
            display('Pobitra is present')
       
         
        
         elseif(Recognized_index==2)
            exdata = {'Ononno',3201, 2, '2019-07-02', 'Present'};
            insert(conn, 'student', colnames, exdata);
            display('Ononno is present')
          
       
         elseif(Recognized_index==3)
            exdata = {'Sourav',3201, 2, '2019-07-02', 'Present'};
            insert(conn, 'student', colnames, exdata);
            display('Sowrav is present') 
         
       
         elseif(Recognized_index==4)
            exdata = {'Abid',3201, 2, '2019-07-02', 'Present'};
            insert(conn, 'student', colnames, exdata);
            display('Abid Hossain is present') 
          
        
       
         elseif(Recognized_index==5)
            exdata = {'Raihan',3201, 2, '2019-07-02', 'Present'};
            insert(conn, 'student', colnames, exdata);
            display('Raihan Hossain is present') 
           
                    
       end   
        
 [OutputName] = strcat(int2str(Recognized_index),'.jpg');
 
