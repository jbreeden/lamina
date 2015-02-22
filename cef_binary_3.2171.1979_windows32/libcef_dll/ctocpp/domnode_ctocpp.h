// Copyright (c) 2014 The Chromium Embedded Framework Authors. All rights
// reserved. Use of this source code is governed by a BSD-style license that
// can be found in the LICENSE file.
//
// ---------------------------------------------------------------------------
//
// This file was generated by the CEF translator tool. If making changes by
// hand only do so within the body of existing method and function
// implementations. See the translator.README.txt file in the tools directory
// for more information.
//

#ifndef CEF_LIBCEF_DLL_CTOCPP_DOMNODE_CTOCPP_H_
#define CEF_LIBCEF_DLL_CTOCPP_DOMNODE_CTOCPP_H_
#pragma once

#ifndef USING_CEF_SHARED
#pragma message("Warning: "__FILE__" may be accessed wrapper-side only")
#else  // USING_CEF_SHARED

#include "include/cef_dom.h"
#include "include/capi/cef_dom_capi.h"
#include "libcef_dll/ctocpp/ctocpp.h"

// Wrap a C structure with a C++ class.
// This class may be instantiated and accessed wrapper-side only.
class CefDOMNodeCToCpp
    : public CefCToCpp<CefDOMNodeCToCpp, CefDOMNode, cef_domnode_t> {
 public:
  explicit CefDOMNodeCToCpp(cef_domnode_t* str)
      : CefCToCpp<CefDOMNodeCToCpp, CefDOMNode, cef_domnode_t>(str) {}
  virtual ~CefDOMNodeCToCpp() {}

  // CefDOMNode methods
  virtual Type GetType() OVERRIDE;
  virtual bool IsText() OVERRIDE;
  virtual bool IsElement() OVERRIDE;
  virtual bool IsEditable() OVERRIDE;
  virtual bool IsFormControlElement() OVERRIDE;
  virtual CefString GetFormControlElementType() OVERRIDE;
  virtual bool IsSame(CefRefPtr<CefDOMNode> that) OVERRIDE;
  virtual CefString GetName() OVERRIDE;
  virtual CefString GetValue() OVERRIDE;
  virtual bool SetValue(const CefString& value) OVERRIDE;
  virtual CefString GetAsMarkup() OVERRIDE;
  virtual CefRefPtr<CefDOMDocument> GetDocument() OVERRIDE;
  virtual CefRefPtr<CefDOMNode> GetParent() OVERRIDE;
  virtual CefRefPtr<CefDOMNode> GetPreviousSibling() OVERRIDE;
  virtual CefRefPtr<CefDOMNode> GetNextSibling() OVERRIDE;
  virtual bool HasChildren() OVERRIDE;
  virtual CefRefPtr<CefDOMNode> GetFirstChild() OVERRIDE;
  virtual CefRefPtr<CefDOMNode> GetLastChild() OVERRIDE;
  virtual CefString GetElementTagName() OVERRIDE;
  virtual bool HasElementAttributes() OVERRIDE;
  virtual bool HasElementAttribute(const CefString& attrName) OVERRIDE;
  virtual CefString GetElementAttribute(const CefString& attrName) OVERRIDE;
  virtual void GetElementAttributes(AttributeMap& attrMap) OVERRIDE;
  virtual bool SetElementAttribute(const CefString& attrName,
      const CefString& value) OVERRIDE;
  virtual CefString GetElementInnerText() OVERRIDE;
};

#endif  // USING_CEF_SHARED
#endif  // CEF_LIBCEF_DLL_CTOCPP_DOMNODE_CTOCPP_H_

