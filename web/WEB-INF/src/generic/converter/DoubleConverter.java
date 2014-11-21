package generic.converter;
 
import static com.google.common.base.Strings.isNullOrEmpty;

import java.text.MessageFormat;
import java.util.ResourceBundle;

import br.com.caelum.vraptor.Convert;
import br.com.caelum.vraptor.Converter;
import br.com.caelum.vraptor.converter.ConversionError;
import br.com.caelum.vraptor.ioc.RequestScoped;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;
 
@Convert(Double.class)
@RequestScoped
public class DoubleConverter implements Converter<Double> {

	public Double convert(String value, Class<? extends Double> type, ResourceBundle bundle){		
		if (isNullOrEmpty(value))
			return null;
		
		try	{
			Double valor = null;
			
			valor = new Double(Double.parseDouble(value.replace("R$ ","").replaceAll("\\.","").replaceAll(",",".")));
			
			return valor;
		} catch (ParseException e) {
			throw new ConversionError(MessageFormat.format(bundle.getString("is_not_a_valid_double"), value));
		}
	}
}