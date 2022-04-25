package service.employee.impl;

import model.employee.Position;
import repository.employee.PositionRepository;
import repository.employee.impl.PositionRepositoryImpl;
import service.employee.PositionService;

import java.util.List;

public class PositionServiceImpl implements PositionService {
PositionRepository positionRepository=new PositionRepositoryImpl();
    @Override
    public List<Position> selectAll() {
        return positionRepository.selectAll();
    }
}
