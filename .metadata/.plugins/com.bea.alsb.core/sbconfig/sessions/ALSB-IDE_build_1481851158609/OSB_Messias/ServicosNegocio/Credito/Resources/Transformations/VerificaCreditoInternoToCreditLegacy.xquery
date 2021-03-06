<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:global-element-parameter parameter="$parametrosVerificaCreditoInterno" element="ns2:parametrosVerificaCreditoInterno" location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)
(:: pragma bea:global-element-return element="ns1:ParametrosCreditLegacy" location="../Interfaces/Schemas/CreditLegacy.xsd" ::)

declare namespace ns2 = "http://pucminas.br/SN/Credito";
declare namespace ns1 = "http://creditlegacy.com.br/SN/CreditLegacy";
declare namespace ns0 = "http://pucminas.br/MC/SOA/Messias";
declare namespace xf = "http://tempuri.org/OSB_Messias/ServicosNegocio/Credito/Resources/Transformations/VerificaCreditoInternoToCreditLegacy/";

declare function xf:VerificaCreditoInternoToCreditLegacy($parametrosVerificaCreditoInterno as element(ns2:parametrosVerificaCreditoInterno))
    as element(ns1:ParametrosCreditLegacy) {
        <ns1:ParametrosCreditLegacy>
            <ns1:cpf>{ data($parametrosVerificaCreditoInterno/ns2:pessoa/ns0:cnpj) }</ns1:cpf>
            <ns1:dt_solicitacao>{ fn:current-date() }</ns1:dt_solicitacao>
        </ns1:ParametrosCreditLegacy>
};

declare variable $parametrosVerificaCreditoInterno as element(ns2:parametrosVerificaCreditoInterno) external;

xf:VerificaCreditoInternoToCreditLegacy($parametrosVerificaCreditoInterno)]]></con:xquery>
    <con:dependency location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd">
        <con:schema ref="OSB_Messias/EBS/Credito/xsd/ParametrosCredito"/>
    </con:dependency>
    <con:dependency location="../Interfaces/Schemas/CreditLegacy.xsd">
        <con:schema ref="OSB_Messias/ServicosNegocio/Credito/Resources/Interfaces/Schemas/CreditLegacy"/>
    </con:dependency>
</con:xqueryEntry>