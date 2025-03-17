--------------------------------------------------------------------
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--------------------------------------------------------------------
--Table Creation:
--Write all SQL statements used to create your tables.


-- Drop tables with CASCADE CONSTRAINTS to remove dependencies

DROP TABLE Message CASCADE CONSTRAINTS;
DROP TABLE ConversationThread CASCADE CONSTRAINTS;
DROP TABLE Certificate CASCADE CONSTRAINTS;
DROP TABLE Feedback CASCADE CONSTRAINTS;
DROP TABLE Announcement CASCADE CONSTRAINTS;
DROP TABLE Post CASCADE CONSTRAINTS;
DROP TABLE StudyGroupMembership CASCADE CONSTRAINTS;
DROP TABLE StudyGroup CASCADE CONSTRAINTS;
DROP TABLE QuizAttempt CASCADE CONSTRAINTS;
DROP TABLE Submission CASCADE CONSTRAINTS;
DROP TABLE Quiz CASCADE CONSTRAINTS;
DROP TABLE Assignment CASCADE CONSTRAINTS;
DROP TABLE Lecture CASCADE CONSTRAINTS;
DROP TABLE S_Module CASCADE CONSTRAINTS;
DROP TABLE Enrollment CASCADE CONSTRAINTS;
DROP TABLE Course CASCADE CONSTRAINTS;
DROP TABLE Instructor CASCADE CONSTRAINTS;
DROP TABLE EducationalBackground CASCADE CONSTRAINTS;
DROP TABLE S_User CASCADE CONSTRAINTS;


-- Create User Table
CREATE TABLE S_User (
    UserID VARCHAR2(50) PRIMARY KEY,
    Password VARCHAR2(50) NOT NULL,
    EmailAddress VARCHAR2(100) NOT NULL,
    ProfilePicture VARCHAR2(1000)
);

-- Create EducationalBackground Table
CREATE TABLE EducationalBackground (
    UserID VARCHAR2(50),
    Degree VARCHAR2(100),
    Institution VARCHAR2(100),
    GraduationYear NUMBER(4),
    PRIMARY KEY (UserID, Degree),
    FOREIGN KEY (UserID) REFERENCES S_User(UserID)
);
-- Create Instructor Table
CREATE TABLE Instructor (
    InstructorID VARCHAR2(50) PRIMARY KEY,
    Biography VARCHAR2(2000)
);

-- Create Course Table
CREATE TABLE Course (
    CourseID VARCHAR2(50) PRIMARY KEY,
    Description VARCHAR2(2000) NOT NULL,
    TopicsCovered VARCHAR2(2000),
    InstructorID VARCHAR2(50),
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

-- Create Enrollment Table
CREATE TABLE Enrollment (
    EnrollmentID VARCHAR2(50) PRIMARY KEY,
    UserID VARCHAR2(50),
    CourseID VARCHAR2(50),
    EnrollmentDate DATE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES S_User(UserID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Create Module Table
CREATE TABLE S_Module (
    ModuleID VARCHAR2(50) PRIMARY KEY,
    CourseID VARCHAR2(50),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Create Lecture Table
CREATE TABLE Lecture (
    LectureID VARCHAR2(50) PRIMARY KEY,
    ModuleID VARCHAR2(50),
    VideoContent VARCHAR2(1000),
    TextSummary VARCHAR2(1000),
    Duration NUMBER,
    FOREIGN KEY (ModuleID) REFERENCES S_Module(ModuleID)
);

-- Create Assignment Table
CREATE TABLE Assignment (
    AssignmentID VARCHAR2(50) PRIMARY KEY,
    ModuleID VARCHAR2(50),
    SubmissionDeadline DATE,
    MaxMarks NUMBER,
    FOREIGN KEY (ModuleID) REFERENCES S_Module(ModuleID)
);

-- Create Quiz Table
CREATE TABLE Quiz (
    QuizID VARCHAR2(50) PRIMARY KEY,
    ModuleID VARCHAR2(50),
    SubmissionDeadline DATE,
    MaxMarks NUMBER,
    FOREIGN KEY (ModuleID) REFERENCES S_Module(ModuleID)
);

-- Create Submission Table
CREATE TABLE Submission (
    SubmissionID VARCHAR2(50) PRIMARY KEY,
    UserID VARCHAR2(50),
    AssignmentID VARCHAR2(50),
    MTimestamp DATE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES S_User(UserID),
    FOREIGN KEY (AssignmentID) REFERENCES Assignment(AssignmentID)
);

-- Create QuizAttempt Table
CREATE TABLE QuizAttempt (
    QuizAttemptID VARCHAR2(50) PRIMARY KEY,
    UserID VARCHAR2(50),
    QuizID VARCHAR2(50),
    Score NUMBER,
    FOREIGN KEY (UserID) REFERENCES S_User(UserID),
    FOREIGN KEY (QuizID) REFERENCES Quiz(QuizID)
);

-- Create StudyGroup Table
CREATE TABLE StudyGroup (
    GroupID VARCHAR2(50) PRIMARY KEY
);

-- Create StudyGroupMembership Table
CREATE TABLE StudyGroupMembership (
    GroupID VARCHAR2(50),
    UserID VARCHAR2(50),
    PRIMARY KEY (GroupID, UserID),
    FOREIGN KEY (GroupID) REFERENCES StudyGroup(GroupID),
    FOREIGN KEY (UserID) REFERENCES S_User(UserID)
);

-- Create Post Table
CREATE TABLE Post (
    PostID VARCHAR2(50) PRIMARY KEY,
    GroupID VARCHAR2(50),
    UserID VARCHAR2(50),
    MTimestamp DATE NOT NULL,
    FOREIGN KEY (GroupID) REFERENCES StudyGroup(GroupID),
    FOREIGN KEY (UserID) REFERENCES S_User(UserID)
);


-- Create Announcement Table
CREATE TABLE Announcement (
    AnnouncementID VARCHAR2(50) PRIMARY KEY,
    CourseID VARCHAR2(50),
    MTimestamp DATE NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Create Feedback Table
CREATE TABLE Feedback (
    FeedbackID VARCHAR2(50) PRIMARY KEY,
    UserID VARCHAR2(50),
    CourseID VARCHAR2(50),
    Ratings NUMBER,
    TextComments VARCHAR2(4000),
    FOREIGN KEY (UserID) REFERENCES S_User(UserID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Create Certificate Table
CREATE TABLE Certificate (
    CertificateID VARCHAR2(50) PRIMARY KEY,
    UserID VARCHAR2(50),
    CourseID VARCHAR2(50),
    DateOfIssuance DATE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES S_User(UserID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Create ConversationThread Table
CREATE TABLE ConversationThread (
    ThreadID VARCHAR2(50) PRIMARY KEY,
    CourseID VARCHAR2(50),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Create Message Table
CREATE TABLE Message (
    MessageID VARCHAR2(50) PRIMARY KEY,
    SenderID VARCHAR2(50),
    ReceiverID VARCHAR2(50),
    MTimestamp DATE NOT NULL,
    ThreadID VARCHAR2(50),
    FOREIGN KEY (SenderID) REFERENCES S_User(UserID),
    FOREIGN KEY (ReceiverID) REFERENCES S_User(UserID),
    FOREIGN KEY (ThreadID) REFERENCES ConversationThread(ThreadID)
);


----------------------------------------------------------------------------------------------------------------------------------------
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
----------------------------------------------------------------------------------------------------------------------------------------
--Database State:
--Write all SQL statements used to insert values into the database 

-- Insert rows into S_User table
INSERT INTO S_User (UserID, Password, EmailAddress, ProfilePicture) VALUES ('user1', 'pass1', 'user1@example.com', 'profile1.jpg');
INSERT INTO S_User (UserID, Password, EmailAddress, ProfilePicture) VALUES ('user2', 'pass2', 'user2@example.com', 'profile2.jpg');
INSERT INTO S_User (UserID, Password, EmailAddress, ProfilePicture) VALUES ('user3', 'pass3', 'user3@example.com', 'profile3.jpg');
INSERT INTO S_User (UserID, Password, EmailAddress, ProfilePicture) VALUES ('user4', 'pass4', 'user4@example.com', 'profile4.jpg');
INSERT INTO S_User (UserID, Password, EmailAddress, ProfilePicture) VALUES ('user5', 'pass5', 'user5@example.com', 'profile5.jpg');
INSERT INTO S_User (UserID, Password, EmailAddress, ProfilePicture) VALUES ('user6', 'pass6', 'user6@example.com', 'profile6.jpg');

-- Insert rows into EducationalBackground table
INSERT INTO EducationalBackground (UserID, Degree, Institution, GraduationYear) VALUES ('user1', 'BSc Computer Science', 'University A', 2020);
INSERT INTO EducationalBackground (UserID, Degree, Institution, GraduationYear) VALUES ('user2', 'BSc Information Technology', 'University B', 2019);
INSERT INTO EducationalBackground (UserID, Degree, Institution, GraduationYear) VALUES ('user3', 'BSc Software Engineering', 'University C', 2021);
INSERT INTO EducationalBackground (UserID, Degree, Institution, GraduationYear) VALUES ('user4', 'MSc Computer Science', 'University A', 2022);
INSERT INTO EducationalBackground (UserID, Degree, Institution, GraduationYear) VALUES ('user5', 'MSc Information Technology', 'University B', 2023);
INSERT INTO EducationalBackground (UserID, Degree, Institution, GraduationYear) VALUES ('user6', 'PhD Computer Science', 'University C', 2024);

-- Insert rows into Instructor table
INSERT INTO Instructor (InstructorID, Biography) VALUES ('inst1', 'Expert in AI and Machine Learning');
INSERT INTO Instructor (InstructorID, Biography) VALUES ('inst2', 'Specialist in Data Science');
INSERT INTO Instructor (InstructorID, Biography) VALUES ('inst3', 'Software Engineering Veteran');
INSERT INTO Instructor (InstructorID, Biography) VALUES ('inst4', 'Cybersecurity Guru');
INSERT INTO Instructor (InstructorID, Biography) VALUES ('inst5', 'Database Systems Expert');
INSERT INTO Instructor (InstructorID, Biography) VALUES ('inst6', 'Web Development Enthusiast');

-- Insert rows into Course table
INSERT INTO Course (CourseID, Description, TopicsCovered, InstructorID, StartDate, EndDate) VALUES ('course1', 'Introduction to AI', 'AI, ML, Neural Networks', 'inst1', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-06-01', 'YYYY-MM-DD'));
INSERT INTO Course (CourseID, Description, TopicsCovered, InstructorID, StartDate, EndDate) VALUES ('course2', 'Data Science Basics', 'Data Analysis, Visualization', 'inst2', TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2023-07-01', 'YYYY-MM-DD'));
INSERT INTO Course (CourseID, Description, TopicsCovered, InstructorID, StartDate, EndDate) VALUES ('course3', 'Advanced Software Engineering', 'Design Patterns, Architecture', 'inst3', TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2023-08-01', 'YYYY-MM-DD'));
INSERT INTO Course (CourseID, Description, TopicsCovered, InstructorID, StartDate, EndDate) VALUES ('course4', 'Cybersecurity Fundamentals', 'Network Security, Encryption', 'inst4', TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2023-09-01', 'YYYY-MM-DD'));
INSERT INTO Course (CourseID, Description, TopicsCovered, InstructorID, StartDate, EndDate) VALUES ('course5', 'Database Systems', 'SQL, NoSQL, Transactions', 'inst5', TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2023-10-01', 'YYYY-MM-DD'));
INSERT INTO Course (CourseID, Description, TopicsCovered, InstructorID, StartDate, EndDate) VALUES ('course6', 'Web Development', 'HTML, CSS, JavaScript', 'inst6', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-11-01', 'YYYY-MM-DD'));

-- Insert rows into Enrollment table
INSERT INTO Enrollment (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES ('enroll1', 'user1', 'course1', TO_DATE('2023-01-05', 'YYYY-MM-DD'));
INSERT INTO Enrollment (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES ('enroll2', 'user2', 'course2', TO_DATE('2023-02-05', 'YYYY-MM-DD'));
INSERT INTO Enrollment (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES ('enroll3', 'user3', 'course3', TO_DATE('2023-03-05', 'YYYY-MM-DD'));
INSERT INTO Enrollment (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES ('enroll4', 'user4', 'course4', TO_DATE('2023-04-05', 'YYYY-MM-DD'));
INSERT INTO Enrollment (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES ('enroll5', 'user5', 'course5', TO_DATE('2023-05-05', 'YYYY-MM-DD'));
INSERT INTO Enrollment (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES ('enroll6', 'user6', 'course6', TO_DATE('2023-06-05', 'YYYY-MM-DD'));

-- Insert rows into S_Module table
INSERT INTO S_Module (ModuleID, CourseID) VALUES ('module1', 'course1');
INSERT INTO S_Module (ModuleID, CourseID) VALUES ('module2', 'course2');
INSERT INTO S_Module (ModuleID, CourseID) VALUES ('module3', 'course3');
INSERT INTO S_Module (ModuleID, CourseID) VALUES ('module4', 'course4');
INSERT INTO S_Module (ModuleID, CourseID) VALUES ('module5', 'course5');
INSERT INTO S_Module (ModuleID, CourseID) VALUES ('module6', 'course6');

-- Insert rows into Lecture table
INSERT INTO Lecture (LectureID, ModuleID, VideoContent, TextSummary, Duration) VALUES ('lecture1', 'module1', 'video1.mp4', 'Summary of lecture 1', 60);
INSERT INTO Lecture (LectureID, ModuleID, VideoContent, TextSummary, Duration) VALUES ('lecture2', 'module2', 'video2.mp4', 'Summary of lecture 2', 45);
INSERT INTO Lecture (LectureID, ModuleID, VideoContent, TextSummary, Duration) VALUES ('lecture3', 'module3', 'video3.mp4', 'Summary of lecture 3', 90);
INSERT INTO Lecture (LectureID, ModuleID, VideoContent, TextSummary, Duration) VALUES ('lecture4', 'module4', 'video4.mp4', 'Summary of lecture 4', 50);
INSERT INTO Lecture (LectureID, ModuleID, VideoContent, TextSummary, Duration) VALUES ('lecture5', 'module5', 'video5.mp4', 'Summary of lecture 5', 30);
INSERT INTO Lecture (LectureID, ModuleID, VideoContent, TextSummary, Duration) VALUES ('lecture6', 'module6', 'video6.mp4', 'Summary of lecture 6', 40);

-- Insert rows into Assignment table
INSERT INTO Assignment (AssignmentID, ModuleID, SubmissionDeadline, MaxMarks) VALUES ('assignment1', 'module1', TO_DATE('2023-02-01', 'YYYY-MM-DD'), 100);
INSERT INTO Assignment (AssignmentID, ModuleID, SubmissionDeadline, MaxMarks) VALUES ('assignment2', 'module2', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 100);
INSERT INTO Assignment (AssignmentID, ModuleID, SubmissionDeadline, MaxMarks) VALUES ('assignment3', 'module3', TO_DATE('2023-04-01', 'YYYY-MM-DD'), 100);
INSERT INTO Assignment (AssignmentID, ModuleID, SubmissionDeadline, MaxMarks) VALUES ('assignment4', 'module4', TO_DATE('2023-05-01', 'YYYY-MM-DD'), 100);
INSERT INTO Assignment (AssignmentID, ModuleID, SubmissionDeadline, MaxMarks) VALUES ('assignment5', 'module5', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 100);
INSERT INTO Assignment (AssignmentID, ModuleID, SubmissionDeadline, MaxMarks) VALUES ('assignment6', 'module6', TO_DATE('2023-07-01', 'YYYY-MM-DD'), 100);

-- Insert rows into Quiz table
INSERT INTO Quiz (QuizID, ModuleID, SubmissionDeadline, MaxMarks) VALUES ('quiz1', 'module1', TO_DATE('2023-02-15', 'YYYY-MM-DD'), 50);
INSERT INTO Quiz (QuizID, ModuleID, SubmissionDeadline, MaxMarks) VALUES ('quiz2', 'module2', TO_DATE('2023-03-15', 'YYYY-MM-DD'), 50);
INSERT INTO Quiz (QuizID, ModuleID, SubmissionDeadline, MaxMarks) VALUES ('quiz3', 'module3', TO_DATE('2023-04-15', 'YYYY-MM-DD'), 50);
INSERT INTO Quiz (QuizID, ModuleID, SubmissionDeadline, MaxMarks) VALUES ('quiz4', 'module4', TO_DATE('2023-05-15', 'YYYY-MM-DD'), 50);
INSERT INTO Quiz (QuizID, ModuleID, SubmissionDeadline, MaxMarks) VALUES ('quiz5', 'module5', TO_DATE('2023-06-15', 'YYYY-MM-DD'), 50);
INSERT INTO Quiz (QuizID, ModuleID, SubmissionDeadline, MaxMarks) VALUES ('quiz6', 'module6', TO_DATE('2023-07-15', 'YYYY-MM-DD'), 50);

-- Insert rows into Submission table
INSERT INTO Submission (SubmissionID, UserID, AssignmentID, MTimestamp) VALUES ('submission1', 'user1', 'assignment1', TO_DATE('2023-02-01', 'YYYY-MM-DD'));
INSERT INTO Submission (SubmissionID, UserID, AssignmentID, MTimestamp) VALUES ('submission2', 'user2', 'assignment2', TO_DATE('2023-03-01', 'YYYY-MM-DD'));
INSERT INTO Submission (SubmissionID, UserID, AssignmentID, MTimestamp) VALUES ('submission3', 'user3', 'assignment3', TO_DATE('2023-04-01', 'YYYY-MM-DD'));
INSERT INTO Submission (SubmissionID, UserID, AssignmentID, MTimestamp) VALUES ('submission4', 'user4', 'assignment4', TO_DATE('2023-05-01', 'YYYY-MM-DD'));
INSERT INTO Submission (SubmissionID, UserID, AssignmentID, MTimestamp) VALUES ('submission5', 'user5', 'assignment5', TO_DATE('2023-06-01', 'YYYY-MM-DD'));
INSERT INTO Submission (SubmissionID, UserID, AssignmentID, MTimestamp) VALUES ('submission6', 'user6', 'assignment6', TO_DATE('2023-07-01', 'YYYY-MM-DD'));

-- Insert rows into QuizAttempt table
INSERT INTO QuizAttempt (QuizAttemptID, UserID, QuizID, Score) VALUES ('attempt1', 'user1', 'quiz1', 45);
INSERT INTO QuizAttempt (QuizAttemptID, UserID, QuizID, Score) VALUES ('attempt2', 'user2', 'quiz2', 40);
INSERT INTO QuizAttempt (QuizAttemptID, UserID, QuizID, Score) VALUES ('attempt3', 'user3', 'quiz3', 42);
INSERT INTO QuizAttempt (QuizAttemptID, UserID, QuizID, Score) VALUES ('attempt4', 'user4', 'quiz4', 44);
INSERT INTO QuizAttempt (QuizAttemptID, UserID, QuizID, Score) VALUES ('attempt5', 'user5', 'quiz5', 43);
INSERT INTO QuizAttempt (QuizAttemptID, UserID, QuizID, Score) VALUES ('attempt6', 'user6', 'quiz6', 41);

-- Insert rows into StudyGroup table
INSERT INTO StudyGroup (GroupID) VALUES ('group1');
INSERT INTO StudyGroup (GroupID) VALUES ('group2');
INSERT INTO StudyGroup (GroupID) VALUES ('group3');
INSERT INTO StudyGroup (GroupID) VALUES ('group4');
INSERT INTO StudyGroup (GroupID) VALUES ('group5');
INSERT INTO StudyGroup (GroupID) VALUES ('group6');

-- Insert rows into StudyGroupMembership table
INSERT INTO StudyGroupMembership (GroupID, UserID) VALUES ('group1', 'user1');
INSERT INTO StudyGroupMembership (GroupID, UserID) VALUES ('group2', 'user2');
INSERT INTO StudyGroupMembership (GroupID, UserID) VALUES ('group3', 'user3');
INSERT INTO StudyGroupMembership (GroupID, UserID) VALUES ('group4', 'user4');
INSERT INTO StudyGroupMembership (GroupID, UserID) VALUES ('group5', 'user5');
INSERT INTO StudyGroupMembership (GroupID, UserID) VALUES ('group6', 'user6');

-- Insert rows into Post table
INSERT INTO Post (PostID, GroupID, UserID, MTimestamp) VALUES ('post1', 'group1', 'user1', TO_DATE('2023-01-01', 'YYYY-MM-DD'));
INSERT INTO Post (PostID, GroupID, UserID, MTimestamp) VALUES ('post2', 'group2', 'user2', TO_DATE('2023-02-01', 'YYYY-MM-DD'));
INSERT INTO Post (PostID, GroupID, UserID, MTimestamp) VALUES ('post3', 'group3', 'user3', TO_DATE('2023-03-01', 'YYYY-MM-DD'));
INSERT INTO Post (PostID, GroupID, UserID, MTimestamp) VALUES ('post4', 'group4', 'user4', TO_DATE('2023-04-01', 'YYYY-MM-DD'));
INSERT INTO Post (PostID, GroupID, UserID, MTimestamp) VALUES ('post5', 'group5', 'user5', TO_DATE('2023-05-01', 'YYYY-MM-DD'));
INSERT INTO Post (PostID, GroupID, UserID, MTimestamp) VALUES ('post6', 'group6', 'user6', TO_DATE('2023-06-01', 'YYYY-MM-DD'));

-- Insert rows into Announcement table
INSERT INTO Announcement (AnnouncementID, CourseID, MTimestamp) VALUES ('ann1', 'course1', TO_DATE('2023-01-01', 'YYYY-MM-DD'));
INSERT INTO Announcement (AnnouncementID, CourseID, MTimestamp) VALUES ('ann2', 'course2', TO_DATE('2023-02-01', 'YYYY-MM-DD'));
INSERT INTO Announcement (AnnouncementID, CourseID, MTimestamp) VALUES ('ann3', 'course3', TO_DATE('2023-03-01', 'YYYY-MM-DD'));
INSERT INTO Announcement (AnnouncementID, CourseID, MTimestamp) VALUES ('ann4', 'course4', TO_DATE('2023-04-01', 'YYYY-MM-DD'));
INSERT INTO Announcement (AnnouncementID, CourseID, MTimestamp) VALUES ('ann5', 'course5', TO_DATE('2023-05-01', 'YYYY-MM-DD'));
INSERT INTO Announcement (AnnouncementID, CourseID, MTimestamp) VALUES ('ann6', 'course6', TO_DATE('2023-06-01', 'YYYY-MM-DD'));

-- Insert rows into Feedback table
INSERT INTO Feedback (FeedbackID, UserID, CourseID, Ratings, TextComments) VALUES ('fb1', 'user1', 'course1', 5, 'Great course!');
INSERT INTO Feedback (FeedbackID, UserID, CourseID, Ratings, TextComments) VALUES ('fb2', 'user2', 'course2', 4, 'Very informative');
INSERT INTO Feedback (FeedbackID, UserID, CourseID, Ratings, TextComments) VALUES ('fb3', 'user3', 'course3', 5, 'Loved it');
INSERT INTO Feedback (FeedbackID, UserID, CourseID, Ratings, TextComments) VALUES ('fb4', 'user4', 'course4', 3, 'Good, but could be better');
INSERT INTO Feedback (FeedbackID, UserID, CourseID, Ratings, TextComments) VALUES ('fb5', 'user5', 'course5', 4, 'Well explained');
INSERT INTO Feedback (FeedbackID, UserID, CourseID, Ratings, TextComments) VALUES ('fb6', 'user6', 'course6', 5, 'Excellent content');

-- Insert rows into Certificate table
INSERT INTO Certificate (CertificateID, UserID, CourseID, DateOfIssuance) VALUES ('cert1', 'user1', 'course1', TO_DATE('2023-06-01', 'YYYY-MM-DD'));
INSERT INTO Certificate (CertificateID, UserID, CourseID, DateOfIssuance) VALUES ('cert2', 'user2', 'course2', TO_DATE('2023-07-01', 'YYYY-MM-DD'));
INSERT INTO Certificate (CertificateID, UserID, CourseID, DateOfIssuance) VALUES ('cert3', 'user3', 'course3', TO_DATE('2023-08-01', 'YYYY-MM-DD'));
INSERT INTO Certificate (CertificateID, UserID, CourseID, DateOfIssuance) VALUES ('cert4', 'user4', 'course4', TO_DATE('2023-09-01', 'YYYY-MM-DD'));
INSERT INTO Certificate (CertificateID, UserID, CourseID, DateOfIssuance) VALUES ('cert5', 'user5', 'course5', TO_DATE('2023-10-01', 'YYYY-MM-DD'));
INSERT INTO Certificate (CertificateID, UserID, CourseID, DateOfIssuance) VALUES ('cert6', 'user6', 'course6', TO_DATE('2023-11-01', 'YYYY-MM-DD'));

-- Insert rows into ConversationThread table
INSERT INTO ConversationThread (ThreadID, CourseID) VALUES ('thread1', 'course1');
INSERT INTO ConversationThread (ThreadID, CourseID) VALUES ('thread2', 'course2');
INSERT INTO ConversationThread (ThreadID, CourseID) VALUES ('thread3', 'course3');
INSERT INTO ConversationThread (ThreadID, CourseID) VALUES ('thread4', 'course4');
INSERT INTO ConversationThread (ThreadID, CourseID) VALUES ('thread5', 'course5');
INSERT INTO ConversationThread (ThreadID, CourseID) VALUES ('thread6', 'course6');

-- Insert rows into Message table
INSERT INTO Message (MessageID, SenderID, ReceiverID, MTimestamp, ThreadID) VALUES ('msg1', 'user1', 'user2', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'thread1');
INSERT INTO Message (MessageID, SenderID, ReceiverID, MTimestamp, ThreadID) VALUES ('msg2', 'user2', 'user3', TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'thread2');
INSERT INTO Message (MessageID, SenderID, ReceiverID, MTimestamp, ThreadID) VALUES ('msg3', 'user3', 'user4', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'thread3');
INSERT INTO Message (MessageID, SenderID, ReceiverID, MTimestamp, ThreadID) VALUES ('msg4', 'user4', 'user5', TO_DATE('2023-04-01', 'YYYY-MM-DD'), 'thread4');
INSERT INTO Message (MessageID, SenderID, ReceiverID, MTimestamp, ThreadID) VALUES ('msg5', 'user5', 'user6', TO_DATE('2023-05-01', 'YYYY-MM-DD'), 'thread5');
INSERT INTO Message (MessageID, SenderID, ReceiverID, MTimestamp, ThreadID) VALUES ('msg6', 'user6', 'user1', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'thread6');


----------------------------------------------------------------------------------------------------------------------------------------
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
----------------------------------------------------------------------------------------------------------------------------------------
--
--4. Create two views and eight queries

-- 1-View for User Enrollment Details: This view combines information f
--rom the S_User, Enrollment, and Course tables to show which users are enrolled in which courses.


CREATE VIEW UserEnrollmentDetails AS
SELECT 
    u.UserID,
    u.EmailAddress,
    c.CourseID,
    c.Description,
    e.EnrollmentDate
FROM 
    S_User u
JOIN 
    Enrollment e ON u.UserID = e.UserID
JOIN 
    Course c ON e.CourseID = c.CourseID;
    


select * from UserEnrollmentDetails;


--2- View for Course Instructors: This view combines information from the Course and Instructor tables 
--to show which instructor is teaching which course.

CREATE VIEW CourseInstructors AS
SELECT 
    c.CourseID,
    c.Description AS CourseDescription,
    i.InstructorID,
    i.Biography AS InstructorBiography
FROM 
    Course c
JOIN 
    Instructor i ON c.InstructorID = i.InstructorID;


select * from CourseInstructors;


--1-Query to find all courses a specific user is enrolled in:
SELECT 
    c.CourseID,
    c.Description
FROM 
    UserEnrollmentDetails ued
JOIN 
    Course c ON ued.CourseID = c.CourseID
WHERE 
    ued.UserID = 'user1';


--2-Query to find all users enrolled in a specific course:

SELECT 
    u.UserID,
    u.EmailAddress
FROM 
    UserEnrollmentDetails ued
JOIN 
    S_User u ON ued.UserID = u.UserID
WHERE 
    ued.CourseID = 'course1';

--3-Query to find the instructor of a specific course:
SELECT 
    ci.InstructorID,
    ci.InstructorBiography
FROM 
    CourseInstructors ci
WHERE 
    ci.CourseID = 'course1';


--4-Query to list all courses along with their instructors:

SELECT 
    ci.CourseID,
    ci.CourseDescription,
    ci.InstructorID,
    ci.InstructorBiography
FROM 
    CourseInstructors ci;

--5-Query to find the details of a user's educational background:
SELECT 
    eb.UserID,
    eb.Degree,
    eb.Institution,
    eb.GraduationYear
FROM 
    EducationalBackground eb
WHERE 
    eb.UserID = 'user1';
--6-Query to find all users who have submitted assignments for a specific module:
SELECT 
    s.UserID,
    s.SubmissionID,
    s.MTimestamp
FROM 
    Submission s
JOIN 
    Assignment a ON s.AssignmentID = a.AssignmentID
WHERE 
    a.ModuleID = 'module1';

--7-Query to get the highest score in a specific quiz:

SELECT 
    MAX(qa.Score) AS HighestScore
FROM 
    QuizAttempt qa
WHERE 
    qa.QuizID = 'quiz1';

--8-Query to list all announcements made for a specific course:
SELECT 
    a.AnnouncementID,
    a.MTimestamp
FROM 
    Announcement a
WHERE 
    a.CourseID = 'course1';

-----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------\-----------------------------------------------------------------------------------------------------------------------------------------------------