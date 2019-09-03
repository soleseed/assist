package hansuo.trainArrival.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hansuo.trainArrival.entity.JobAutoInfo;
import hansuo.trainArrival.entity.JobAutoInfoEx;
import hansuo.trainArrival.mapper.JobAutoInfoMapper;
import hansuo.trainArrival.service.JobAutoInfoService;

@Service
public class JobAutoInfoServiceImpl implements JobAutoInfoService {

	@Autowired
	private JobAutoInfoMapper dao;

	@Override
	public int add(JobAutoInfo info) {
		return dao.insert(info);
	}

	@Override
	public List<JobAutoInfoEx> search(JobAutoInfo info) {
		return dao.searchByConditions(info);
	}

	@Override
	public JobAutoInfoEx getById(JobAutoInfo info) {
		return dao.getById(info.getId());
	}

}
