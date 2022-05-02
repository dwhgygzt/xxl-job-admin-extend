package com.xxl.job.admin.core.conf;

import cn.hutool.core.date.DatePattern;
import com.alibaba.fastjson.serializer.SerializeConfig;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.ToStringSerializer;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * @author <a href="mailto:guzt@126.com">guzhongtao</a>
 */
@Configuration
public class MyFastJsonConfig {

    @Bean
    FastJsonHttpMessageConverter fastJsonHttpMessageConverter() {
        FastJsonHttpMessageConverter converter = new FastJsonHttpMessageConverter();
        List<MediaType> supportedMediaTypes = new ArrayList<>();
        supportedMediaTypes.add(MediaType.APPLICATION_JSON);
        converter.setSupportedMediaTypes(supportedMediaTypes);

        FastJsonConfig config = new FastJsonConfig();
        config.setDateFormat(DatePattern.NORM_DATETIME_PATTERN);
        config.setCharset(StandardCharsets.UTF_8);

        config.setSerializerFeatures(
                SerializerFeature.WriteMapNullValue,
                SerializerFeature.WriteNullListAsEmpty,
                SerializerFeature.PrettyFormat,
                SerializerFeature.WriteNullStringAsEmpty,
                SerializerFeature.DisableCircularReferenceDetect
        );

        //解决Long转json精度丢失的问题
        SerializeConfig serializeConfig = SerializeConfig.globalInstance;
        serializeConfig.put(BigInteger.class, ToStringSerializer.instance);
        serializeConfig.put(Long.class, ToStringSerializer.instance);
        serializeConfig.put(Long.TYPE, ToStringSerializer.instance);
        config.setSerializeConfig(serializeConfig);

        converter.setFastJsonConfig(config);
        return converter;
    }
}