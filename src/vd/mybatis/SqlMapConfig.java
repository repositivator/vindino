package vd.mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	public static SqlSessionFactory sqlSession;
	
	static {
		String resource = "vd/mybatis/Configuration.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlSession = new SqlSessionFactoryBuilder().build(reader);	//하나의 작업 단위를 만듦
			reader.close();
			
			//Using MyBatis Annotation
			Class[] mappers = {vd.business.SqlMapperInter.class, vd.business.SqlMapperInterMember.class,
					vd.mybatis.SqlMapperInterTasting.class, vd.business.SqlMapperInterWine.class};
			for(Class m: mappers){	//배열을 자동 추가
				sqlSession.getConfiguration().addMapper(m);
			}
		} catch (Exception e) {
			System.out.println("SqlMapConfig err: " + e);
		}
	}
	
	public static SqlSessionFactory getSqlSession(){
		return sqlSession;
	}
}
