package service.employee.impl;

import model.employee.EducationDegree;
import repository.employee.EducationDegreeRepository;
import repository.employee.impl.EducationDegreeRepositoryImpl;
import service.employee.EducationDegreeService;

import java.util.List;

public class EducationServiceImpl implements EducationDegreeService {
    EducationDegreeRepository educationDegreeRepository=new EducationDegreeRepositoryImpl();
    @Override
    public List<EducationDegree> selectAll() {
        return educationDegreeRepository.selectAll();
    }
}
