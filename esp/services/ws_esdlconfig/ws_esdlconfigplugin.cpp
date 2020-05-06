/*##############################################################################

    HPCC SYSTEMS software Copyright (C) 2013 HPCC Systems®.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
############################################################################## */

#pragma warning (disable : 4786)

#ifndef WsESDLConfig_API
#define WsESDLConfig_API DECL_EXPORT
#endif //WsESDLConfig_API

#include "ws_esdlconfig_esp.ipp"

//ESP Bindings
#include "httpprot.hpp"

//ESP Service
#include "ws_esdlconfigservice.hpp"

#include "espplugin.hpp"

extern "C"
{
//when we aren't loading dynamically
// Change the function names when we stick with dynamic loading.
ESP_FACTORY IEspService * esp_service_factory(const char *name, const char* type, IPropertyTree *cfg, const char *process)
{
    if (strieq(type, "ws_esdlconfig"))
    {
        CWsESDLConfigEx* service = new CWsESDLConfigEx;

        service->init(cfg, process, name);
        return service;
    }
    return NULL;
}

ESP_FACTORY IEspRpcBinding * esp_binding_factory(const char *name, const char* type, IPropertyTree *cfg, const char *process)
{
    //binding names ending in _http are being added so the names can be made more consistent and can therefore be automatically generated
    //  the name also better reflects that these bindings are for all HTTP based protocols, not just SOAP
    //  both "SoapBinding" and "_http" names instantiate the same objects.
    if (strieq(type, "ws_esdlconfigSoapBinding")||strieq(type, "ws_esdlconfig_http"))
    {
#ifdef _DEBUG
        http_soap_log_level log_level_ = hsl_all;
#else
        http_soap_log_level log_level_ = hsl_none;
#endif
        return new CWsESDLConfigSoapBindingEx(cfg, name, process, log_level_);
    }

    return NULL;
}

ESP_FACTORY IEspProtocol * esp_protocol_factory(const char *name, const char* type, IPropertyTree *cfg, const char *process)
{
    return http_protocol_factory(name, type, cfg, process);
}

};
