package com.my.alma.controller.restAPI;

import com.my.alma.dao.ClassTypeRepository;
import com.my.alma.dao.HostelRepository;
import com.my.alma.dao.RoleRepository;
import com.my.alma.dao.UserRepository;
import com.my.alma.model.*;
import com.my.alma.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.List;

@RestController
public class MainRestController {

    @Autowired
    UserRepository userRepository;
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    HostelRepository hostelRepository;
    @Autowired
    ClassTypeRepository classTypeRepository;
    @Autowired
    ApplicantsApplicationService applicantsApplicationService;
    @Autowired
    FacultyService facultyService;
    @Autowired
    SpecialtyService specialtyService;
    @Autowired
    DisciplineService disciplineService;
    @Autowired
    ErrorReportService errorReportService;
    @Autowired
    StudentService studentService;
    @Autowired
    TeacherService teacherService;
    @Autowired
    AgentService agentService;
    @Autowired
    HousingWorkerService housingWorkerService;
    @Autowired
    HostelService hostelService;
    @Autowired
    RoomService roomService;
    @Autowired
    NewsService newsService;
    @Autowired
    ClazzService clazzService;
    @Autowired
    SkillService skillService;

    @ResponseBody
    @RequestMapping(value = "/sendAppApp", method = RequestMethod.POST)
    public String sendAppApp(@RequestParam(value = "authorName", required = true) String authorName,
                             @RequestParam(value = "title", required = true) String title,
                             @RequestParam(value = "text", required = true) String text,
                             @RequestParam(value = "email", required = true) String email,
                             @RequestParam(value = "facultyId", required = true) Integer facultyId) {
        ApplicantsApplication appl = new ApplicantsApplication();
        appl.setAuthorName(authorName);
        appl.setEmail(email);
        appl.setTitle(title);
        appl.setText(text);
        Faculty faculty = facultyService.getById(facultyId);
        appl.setFaculty(faculty);
        applicantsApplicationService.save(appl);
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "/reportBug", method = RequestMethod.POST)
    public String reportBug(@RequestParam(value = "problem", required = true) String problem,
                            @RequestParam(value = "authorName", required = true) String authorName,
                            @RequestParam(value = "email", required = true) String email) {
        ErrorReport errorReport = new ErrorReport();
        errorReport.setText(problem);
        errorReport.setEmail(email);
        errorReport.setAuthorName(authorName);
        errorReportService.save(errorReport);
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "/addNewFaculty", method = RequestMethod.POST)
    public String addNewFaculty(@RequestParam(value = "name", required = true) String name) {
        Faculty faculty = new Faculty();
        faculty.setName(name);
        facultyService.save(faculty);
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "/addNewSpecialty", method = RequestMethod.POST)
    public String addNewSpecialty(@RequestParam(value = "name", required = true) String name,
                                  @RequestParam(value = "facultyId", required = true) Integer facultyId) {
        Faculty faculty = facultyService.getById(facultyId);
        Specialty specialty = new Specialty();
        specialty.setName(name);
        specialty.setFaculty(faculty);
        specialtyService.save(specialty);
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "/addNewDiscipline", method = RequestMethod.POST)
    public String addNewDiscipline(@RequestParam(value = "name", required = true) String name,
                                   @RequestParam(value = "specialtyId", required = true) Integer specialtyId) {
        Discipline discipline = new Discipline();
        discipline.setName(name);
        Specialty specialty = specialtyService.getById(specialtyId);
        discipline.setSpecialty(specialty);
        disciplineService.save(discipline);
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "/setTeacherDiscipline", method = RequestMethod.POST)
    public String setTeacherDiscipline(@RequestParam(value = "teacherId", required = true) Integer teacherId,
                                       @RequestParam(value = "disciplineId", required = true) Integer disciplineId) {
        List<Discipline> alreadySettedDisciplines = teacherService.getDisciplinesByTeacherId(teacherId);
        Discipline discipline = disciplineService.getById(disciplineId);
        if(alreadySettedDisciplines.contains(discipline)) {
            return "success";
        }else {
            teacherService.setDiscipline(teacherId, disciplineId);
            return "success";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/addNewHostel", method = RequestMethod.POST)
    public String addNewHostel(@RequestParam(value = "hostelAddress", required = true) String hostelAddress) {
        Hostel hostel = new Hostel();
        hostel.setAddress(hostelAddress);
        hostelService.save(hostel);
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "/addNewRoom", method = RequestMethod.POST)
    public String addNewRoom(@RequestParam(value = "roomNumber", required = true) Integer roomNumber,
                             @RequestParam(value = "roomSize", required = true) Integer roomSize,
                             @RequestParam(value = "roomSex", required = true) byte roomSex,
                             @RequestParam(value = "hostelId", required = true) Integer hostelId) {
        Room room = new Room();
        room.setNumber(roomNumber);
        room.setSize(roomSize);
        room.setSex(roomSex);
        Hostel hostel = hostelRepository.findOne(hostelId);
        room.setHostel(hostel);
        roomService.save(room);
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "/addNewNews", method = RequestMethod.POST)
    public String addNewNews(@RequestParam(value = "newsTitle", required = true) String newsTitle,
                             @RequestParam(value = "newsText", required = true) String newsText,
                             @RequestParam(value = "newsFaculty", required = true) Integer newsFaculty,
                             @RequestParam(value = "newsRoleId", required = true) Integer newsRoleId) {

        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession(true);
        User curUser = userRepository.findOne((Integer)session.getAttribute("id"));
        long millis=System.currentTimeMillis();
        Date date=new java.sql.Date(millis);
        Faculty faculty = null;
        if(newsFaculty != -1){
            faculty = facultyService.getById(newsFaculty);
        }
        Role forRole = null;
        if(newsRoleId != -1) {
            forRole = roleRepository.findOne(newsRoleId);
        }
        News news = new News();
        news.setAuthor(curUser);
        news.setDate(date);
        news.setFaculty(faculty);
        news.setRole(forRole);
        news.setText(newsText);
        news.setTitle(newsTitle);
        newsService.save(news);
        return "success";
    }











    @ResponseBody
    @RequestMapping(value = "/addNewStudent", method = RequestMethod.POST)
    public String addNewStudent(// General info
                                @RequestParam(value = "studentEmail", required = true) String userEmail,
                                @RequestParam(value = "studentPassword", required = true) String userPassword,
                                @RequestParam(value = "studentFirstname", required = true) String firstname,
                                @RequestParam(value = "studentPatronymic", required = true) String patronymic,
                                @RequestParam(value = "studentLastname", required = true) String lastname,
                                @RequestParam(value = "studentPhone", required = true) String phone,
                                // Specific info
                                @RequestParam(value = "studentDateOfBirth", required = true) Date dateOfBirth,
                                @RequestParam(value = "studentSex", required = true) byte sex,
                                @RequestParam(value = "studentEntryDate", required = true) Date entryDate,
                                @RequestParam(value = "studentCourse", required = true) Integer course,
                                @RequestParam(value = "studentFacultyId", required = true) Integer facultyId) {
        User user = new User();
        user.setEmail(userEmail);
        user.setPassword(userPassword);
        user.setFirstname(firstname);
        user.setPatronymic(patronymic);
        user.setLastname(lastname);
        user.setPhone(phone);

        Role role = roleRepository.getByRole("STUDENT");
        user.setRole(role);
        Student student = new Student();
        student.setDateOfBirth(dateOfBirth);
        student.setSex(sex);
        student.setEntryDate(entryDate);
        student.setCourse(course);
        Faculty faculty = facultyService.getById(facultyId);
        student.setFaculty(faculty);

        studentService.save(user, student);
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "/addNewTeacher", method = RequestMethod.POST)
    public String addNewTeacher(// General info
                                @RequestParam(value = "teacherEmail", required = true) String userEmail,
                                @RequestParam(value = "teacherPassword", required = true) String userPassword,
                                @RequestParam(value = "teacherFirstname", required = true) String firstname,
                                @RequestParam(value = "teacherPatronymic", required = true) String patronymic,
                                @RequestParam(value = "teacherLastname", required = true) String lastname,
                                @RequestParam(value = "teacherPhone", required = true) String phone,
                                // Specific info
                                @RequestParam(value = "hoursForConsultations", required = true) String hoursForConsultations,
                                @RequestParam(value = "teacherFacultyId", required = true) Integer facultyId) {
        User user = new User();
        user.setEmail(userEmail);
        user.setPassword(userPassword);
        user.setFirstname(firstname);
        user.setPatronymic(patronymic);
        user.setLastname(lastname);
        user.setPhone(phone);

        Role role = roleRepository.getByRole("TEACHER");
        user.setRole(role);
        Teacher teacher = new Teacher();
        teacher.setHoursForConsultations(hoursForConsultations);
        Faculty faculty = facultyService.getById(facultyId);
        teacher.setFaculty(faculty);

        teacherService.save(user, teacher);
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "/addNewAgent", method = RequestMethod.POST)
    public String addNewAgent(// General info
                                @RequestParam(value = "agentEmail", required = true) String userEmail,
                                @RequestParam(value = "agentPassword", required = true) String userPassword,
                                @RequestParam(value = "agentFirstname", required = true) String firstname,
                                @RequestParam(value = "agentPatronymic", required = true) String patronymic,
                                @RequestParam(value = "agentLastname", required = true) String lastname,
                                @RequestParam(value = "agentPhone", required = true) String phone,
                                // Specific info
                                @RequestParam(value = "agentCompany", required = true) String agentCompany,
                                @RequestParam(value = "companyDescription", required = true) String companyDescription) {
        User user = new User();
        user.setEmail(userEmail);
        user.setPassword(userPassword);
        user.setFirstname(firstname);
        user.setPatronymic(patronymic);
        user.setLastname(lastname);
        user.setPhone(phone);

        Role role = roleRepository.getByRole("AGENT");
        user.setRole(role);
        Agent agent = new Agent();
        agent.setCompany(agentCompany);
        agent.setDescription(companyDescription);

        agentService.save(user, agent);
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "/addNewWorker", method = RequestMethod.POST)
    public String addNewWorker(@RequestParam(value = "workerEmail", required = true) String userEmail,
                               @RequestParam(value = "workerPassword", required = true) String userPassword,
                               @RequestParam(value = "workerFirstname", required = true) String firstname,
                               @RequestParam(value = "workerPatronymic", required = true) String patronymic,
                               @RequestParam(value = "workerLastname", required = true) String lastname,
                               @RequestParam(value = "workerPhone", required = true) String phone) {
        User user = new User();
        user.setEmail(userEmail);
        user.setPassword(userPassword);
        user.setFirstname(firstname);
        user.setPatronymic(patronymic);
        user.setLastname(lastname);
        user.setPhone(phone);

        Role role = roleRepository.getByRole("WORKER");
        user.setRole(role);
        housingWorkerService.save(user);
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "/addNewClass", method = RequestMethod.POST)
    public String addNewClass(@RequestParam(value = "classDisciplineId", required = true) Integer classDisciplineId,
                              @RequestParam(value = "classInfo", required = true) String classInfo,
                              @RequestParam(value = "classTypeId", required = true) Integer classTypeId,
                              @RequestParam(value = "classDate", required = true) Date classDate) {
        Clazz clazz = new Clazz();
        ClassType classType = classTypeRepository.findOne(classTypeId);
        clazz.setClassType(classType);
        clazz.setDate(classDate);
        Discipline discipline = disciplineService.getById(classDisciplineId);
        clazz.setDiscipline(discipline);
        clazz.setInfo(classInfo);
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession(true);
        User curUser = userRepository.findOne((Integer)session.getAttribute("id"));
        Teacher teacher = teacherService.getTeacherByUser(curUser);
        clazzService.save(clazz);
        clazzService.addTeacherToClass(teacher.getId(), clazz.getId());
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "/addSkill", method = RequestMethod.POST)
    public String addNewClass(@RequestParam(value = "skillName", required = true) String skillName,
                              @RequestParam(value = "skillDesc", required = true) String skillDesc) {
        Skill skill = new Skill();
        skill.setName(skillName);
        skill.setDescription(skillDesc);
        skillService.save(skill);
        return "success";
    }

}
