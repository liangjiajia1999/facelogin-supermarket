package com.hdp.dao.factory;

import com.hdp.dao.CategoryDao;
import com.hdp.dao.ProductDao;
import com.hdp.dao.ProviderDao;
import com.hdp.dao.SaleDao;
import com.hdp.dao.SaleItemDao;
import com.hdp.dao.SaveRecordDao;
import com.hdp.dao.StockDao;
import com.hdp.dao.UnitDao;
import com.hdp.dao.UserDao;
import com.hdp.dao.VipDao;
import com.hdp.dao.impl.CategoryDaoImpl;
import com.hdp.dao.impl.ProductDaoImpl;
import com.hdp.dao.impl.ProviderDaoImpl;
import com.hdp.dao.impl.SaleDaoImpl;
import com.hdp.dao.impl.SaleItemDaoImpl;
import com.hdp.dao.impl.SaveRecordDaoImpl;
import com.hdp.dao.impl.StockDaoImpl;
import com.hdp.dao.impl.UnitDaoImpl;
import com.hdp.dao.impl.UserDaoImpl;
import com.hdp.dao.impl.VipDaoImpl;

public class DaoFactory {
	public static UserDao getUserDao(){
		return new UserDaoImpl();
	}
	public static CategoryDao getCategoryDao(){
		return new CategoryDaoImpl();
	}
	public static UnitDao getUnitDao(){
		return new UnitDaoImpl();
	}
	public static ProviderDao getProviderDao(){
		return new ProviderDaoImpl();
	}
	public static VipDao getVipDao(){
		return new VipDaoImpl();
	}
	public static ProductDao getProductDao(){
		return new ProductDaoImpl();
	}
	public static SaveRecordDao getSaveRecordDao(){
		return new SaveRecordDaoImpl();
	}
	public static StockDao getStockDao(){
		return new StockDaoImpl();
	}
	public static SaleDao getSaleDao(){
		return new SaleDaoImpl();
	}
	public static SaleItemDao getSaleItemDao(){
		return new SaleItemDaoImpl();
	}
}
