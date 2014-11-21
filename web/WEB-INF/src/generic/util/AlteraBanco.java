package generic.util;

import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaUpdate;

public class AlteraBanco {

	public static void main(String[] args) {

		Configuration configuration = new Configuration();

		configuration.configure("hibernate.cfg.xml");

		SchemaUpdate update = new SchemaUpdate(configuration);
		update.execute(true, true);
	}

}