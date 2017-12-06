var search_data = {"index":{"searchIndex":["publicsuffix","domain","domaininvalid","domainnotallowed","error","list","rule","base","exception","normal","wildcard","<<()","==()","==()","add()","build()","build()","build()","clear()","decompose()","decompose()","decompose()","decompose()","decompose()","default()","default()","default=()","default_rule()","domain()","domain()","domain?()","each()","empty?()","entry_to_rule()","eql?()","eql?()","factory()","find()","match?()","name()","name_to_labels()","new()","new()","new()","new()","normalize()","parse()","parse()","parts()","parts()","parts()","parts()","rule()","rule()","rule()","rule_to_entry()","select()","size()","subdomain()","subdomain?()","to_a()","to_s()","valid?()","license"],"longSearchIndex":["publicsuffix","publicsuffix::domain","publicsuffix::domaininvalid","publicsuffix::domainnotallowed","publicsuffix::error","publicsuffix::list","publicsuffix::rule","publicsuffix::rule::base","publicsuffix::rule::exception","publicsuffix::rule::normal","publicsuffix::rule::wildcard","publicsuffix::list#<<()","publicsuffix::list#==()","publicsuffix::rule::base#==()","publicsuffix::list#add()","publicsuffix::rule::base::build()","publicsuffix::rule::exception::build()","publicsuffix::rule::wildcard::build()","publicsuffix::list#clear()","publicsuffix::decompose()","publicsuffix::rule::base#decompose()","publicsuffix::rule::exception#decompose()","publicsuffix::rule::normal#decompose()","publicsuffix::rule::wildcard#decompose()","publicsuffix::list::default()","publicsuffix::rule::default()","publicsuffix::list::default=()","publicsuffix::list#default_rule()","publicsuffix::domain()","publicsuffix::domain#domain()","publicsuffix::domain#domain?()","publicsuffix::list#each()","publicsuffix::list#empty?()","publicsuffix::list#entry_to_rule()","publicsuffix::list#eql?()","publicsuffix::rule::base#eql?()","publicsuffix::rule::factory()","publicsuffix::list#find()","publicsuffix::rule::base#match?()","publicsuffix::domain#name()","publicsuffix::domain::name_to_labels()","publicsuffix::domain::new()","publicsuffix::list::new()","publicsuffix::rule::base::new()","publicsuffix::rule::wildcard::new()","publicsuffix::normalize()","publicsuffix::parse()","publicsuffix::list::parse()","publicsuffix::rule::base#parts()","publicsuffix::rule::exception#parts()","publicsuffix::rule::normal#parts()","publicsuffix::rule::wildcard#parts()","publicsuffix::rule::exception#rule()","publicsuffix::rule::normal#rule()","publicsuffix::rule::wildcard#rule()","publicsuffix::list#rule_to_entry()","publicsuffix::list#select()","publicsuffix::list#size()","publicsuffix::domain#subdomain()","publicsuffix::domain#subdomain?()","publicsuffix::domain#to_a()","publicsuffix::domain#to_s()","publicsuffix::valid?()",""],"info":[["PublicSuffix","","PublicSuffix.html","","<p>PublicSuffix is a Ruby domain name parser based on the Public Suffix List.\n<p>The [Public Suffix List](publicsuffix.org …\n"],["PublicSuffix::Domain","","PublicSuffix/Domain.html","","<p>Domain represents a domain name, composed by a TLD, SLD and TRD.\n"],["PublicSuffix::DomainInvalid","","PublicSuffix/DomainInvalid.html","","<p>Raised when trying to parse an invalid name. A name is considered invalid\nwhen no rule is found in the …\n"],["PublicSuffix::DomainNotAllowed","","PublicSuffix/DomainNotAllowed.html","","<p>Raised when trying to parse a name that matches a suffix.\n<p>@example\n\n<pre class=\"ruby\"><span class=\"ruby-constant\">PublicSuffix</span>.<span class=\"ruby-identifier\">parse</span>(<span class=\"ruby-string\">&quot;nic.do&quot;</span>)\n<span class=\"ruby-comment\"># =&gt; PublicSuffix::DomainNotAllowed ...</span>\n</pre>\n"],["PublicSuffix::Error","","PublicSuffix/Error.html","",""],["PublicSuffix::List","","PublicSuffix/List.html","","<p>A {PublicSuffix::List} is a collection of one or more {PublicSuffix::Rule}.\n<p>Given a {PublicSuffix::List}, …\n"],["PublicSuffix::Rule","","PublicSuffix/Rule.html","","<p>A Rule is a special object which holds a single definition of the Public\nSuffix List.\n<p>There are 3 types …\n"],["PublicSuffix::Rule::Base","","PublicSuffix/Rule/Base.html","","<p>Abstract rule class\n<p>This represent the base class for a Rule definition in the Public Suffix\nList.\n<p>This …\n"],["PublicSuffix::Rule::Exception","","PublicSuffix/Rule/Exception.html","","<p>Exception represents an exception rule (e.g. !parliament.uk).\n"],["PublicSuffix::Rule::Normal","","PublicSuffix/Rule/Normal.html","","<p>Normal represents a standard rule (e.g. com).\n"],["PublicSuffix::Rule::Wildcard","","PublicSuffix/Rule/Wildcard.html","","<p>Wildcard represents a wildcard rule (e.g. *.co.uk).\n"],["<<","PublicSuffix::List","PublicSuffix/List.html#method-i-3C-3C","(rule)",""],["==","PublicSuffix::List","PublicSuffix/List.html#method-i-3D-3D","(other)","<p>Checks whether two lists are equal.\n<p>List <code>one</code> is equal to <code>two</code>, if <code>two</code> is\nan instance of {PublicSuffix::List} …\n"],["==","PublicSuffix::Rule::Base","PublicSuffix/Rule/Base.html#method-i-3D-3D","(other)","<p>Checks whether this rule is equal to <code>other</code>.\n<p>@param  [PublicSuffix::Rule::*] other The rule to compare …\n"],["add","PublicSuffix::List","PublicSuffix/List.html#method-i-add","(rule)","<p>Adds the given object to the list and optionally refreshes the rule index.\n<p>@param  rule [PublicSuffix::Rule::*] …\n"],["build","PublicSuffix::Rule::Base","PublicSuffix/Rule/Base.html#method-c-build","(content, private: false)","<p>Initializes a new rule from the content.\n<p>@param  content [String] the content of the rule @param  private …\n"],["build","PublicSuffix::Rule::Exception","PublicSuffix/Rule/Exception.html#method-c-build","(content, private: false)","<p>Initializes a new rule from the content.\n<p>@param  content [String] the content of the rule @param  private …\n"],["build","PublicSuffix::Rule::Wildcard","PublicSuffix/Rule/Wildcard.html#method-c-build","(content, private: false)","<p>Initializes a new rule from the content.\n<p>@param  content [String] the content of the rule @param  private …\n"],["clear","PublicSuffix::List","PublicSuffix/List.html#method-i-clear","()","<p>Removes all rules.\n<p>@return [self]\n"],["decompose","PublicSuffix","PublicSuffix.html#method-c-decompose","(name, rule)","<p>private\n"],["decompose","PublicSuffix::Rule::Base","PublicSuffix/Rule/Base.html#method-i-decompose","(*)","<p>@abstract @param  [String, #to_s] name The domain name to decompose @return\n[Array&lt;String, nil&gt;] …\n"],["decompose","PublicSuffix::Rule::Exception","PublicSuffix/Rule/Exception.html#method-i-decompose","(domain)","<p>Decomposes the domain name according to rule properties.\n<p>@param  [String, #to_s] name The domain name …\n"],["decompose","PublicSuffix::Rule::Normal","PublicSuffix/Rule/Normal.html#method-i-decompose","(domain)","<p>Decomposes the domain name according to rule properties.\n<p>@param  [String, #to_s] name The domain name …\n"],["decompose","PublicSuffix::Rule::Wildcard","PublicSuffix/Rule/Wildcard.html#method-i-decompose","(domain)","<p>Decomposes the domain name according to rule properties.\n<p>@param  [String, #to_s] name The domain name …\n"],["default","PublicSuffix::List","PublicSuffix/List.html#method-c-default","(**options)","<p>Gets the default rule list.\n<p>Initializes a new {PublicSuffix::List} parsing the content of\n{PublicSuffix::List.default_list_content}, …\n"],["default","PublicSuffix::Rule","PublicSuffix/Rule.html#method-c-default","()","<p>The default rule to use if no rule match.\n<p>The default rule is “*”. From publicsuffix.org/list …\n"],["default=","PublicSuffix::List","PublicSuffix/List.html#method-c-default-3D","(value)","<p>Sets the default rule list to <code>value</code>.\n<p>@param  value [PublicSuffix::List] the new list @return\n[PublicSuffix::List] …\n"],["default_rule","PublicSuffix::List","PublicSuffix/List.html#method-i-default_rule","()","<p>Gets the default rule.\n<p>@see PublicSuffix::Rule.default_rule\n<p>@return [PublicSuffix::Rule::*]\n"],["domain","PublicSuffix","PublicSuffix.html#method-c-domain","(name, **options)","<p>Attempt to parse the name and returns the domain, if valid.\n<p>This method doesn&#39;t raise. Instead, it …\n"],["domain","PublicSuffix::Domain","PublicSuffix/Domain.html#method-i-domain","()","<p>Returns a domain-like representation of this object if the object is a\n{#domain?}, <code>nil</code> otherwise.\n\n<pre>PublicSuffix::Domain.new(&quot;com&quot;).domain ...</pre>\n"],["domain?","PublicSuffix::Domain","PublicSuffix/Domain.html#method-i-domain-3F","()","<p>Checks whether <code>self</code> looks like a domain.\n<p>This method doesn&#39;t actually validate the domain. It only …\n"],["each","PublicSuffix::List","PublicSuffix/List.html#method-i-each","(&block)","<p>Iterates each rule in the list.\n"],["empty?","PublicSuffix::List","PublicSuffix/List.html#method-i-empty-3F","()","<p>Checks whether the list is empty.\n<p>@return [Boolean]\n"],["entry_to_rule","PublicSuffix::List","PublicSuffix/List.html#method-i-entry_to_rule","(entry, value)",""],["eql?","PublicSuffix::List","PublicSuffix/List.html#method-i-eql-3F","(other)",""],["eql?","PublicSuffix::Rule::Base","PublicSuffix/Rule/Base.html#method-i-eql-3F","(other)",""],["factory","PublicSuffix::Rule","PublicSuffix/Rule.html#method-c-factory","(content, private: false)","<p>Takes the <code>name</code> of the rule, detects the specific rule class\nand creates a new instance of that class. …\n"],["find","PublicSuffix::List","PublicSuffix/List.html#method-i-find","(name, default: default_rule, **options)","<p>Finds and returns the rule corresponding to the longest public suffix for\nthe hostname.\n<p>@param  name [#to_s] …\n"],["match?","PublicSuffix::Rule::Base","PublicSuffix/Rule/Base.html#method-i-match-3F","(name)","<p>Checks if this rule matches <code>name</code>.\n<p>A domain name is said to match a rule if and only if all of the following …\n"],["name","PublicSuffix::Domain","PublicSuffix/Domain.html#method-i-name","()","<p>Returns the full domain name.\n<p>@return [String]\n<p>@example Gets the domain name of a domain\n"],["name_to_labels","PublicSuffix::Domain","PublicSuffix/Domain.html#method-c-name_to_labels","(name)","<p>Splits a string into the labels, that is the dot-separated parts.\n<p>The input is not validated, but it is …\n"],["new","PublicSuffix::Domain","PublicSuffix/Domain.html#method-c-new","(*args)","<p>Creates and returns a new {PublicSuffix::Domain} instance.\n<p>@overload initialize(tld)\n\n<pre>Initializes with a ...</pre>\n"],["new","PublicSuffix::List","PublicSuffix/List.html#method-c-new","()","<p>Initializes an empty {PublicSuffix::List}.\n<p>@yield [self] Yields on self. @yieldparam [PublicSuffix::List] …\n"],["new","PublicSuffix::Rule::Base","PublicSuffix/Rule/Base.html#method-c-new","(value:, length: nil, private: false)","<p>Initializes a new rule.\n<p>@param  value [String] @param  private [Boolean]\n"],["new","PublicSuffix::Rule::Wildcard","PublicSuffix/Rule/Wildcard.html#method-c-new","(value:, length: nil, private: false)","<p>Initializes a new rule.\n<p>@param  value [String] @param  private [Boolean]\n"],["normalize","PublicSuffix","PublicSuffix.html#method-c-normalize","(name)","<p>Pretend we know how to deal with user input.\n"],["parse","PublicSuffix","PublicSuffix.html#method-c-parse","(name, list: List.default, default_rule: list.default_rule, ignore_private: false)","<p>Parses <code>name</code> and returns the {PublicSuffix::Domain} instance.\n<p>@example Parse a valid domain\n\n<pre>PublicSuffix.parse(&quot;google.com&quot;) ...</pre>\n"],["parse","PublicSuffix::List","PublicSuffix/List.html#method-c-parse","(input, private_domains: true)","<p>Parse given <code>input</code> treating the content as Public Suffix List.\n<p>See publicsuffix.org/format/ for more details …\n"],["parts","PublicSuffix::Rule::Base","PublicSuffix/Rule/Base.html#method-i-parts","()","<p>@abstract\n"],["parts","PublicSuffix::Rule::Exception","PublicSuffix/Rule/Exception.html#method-i-parts","()","<p>dot-split rule value and returns all rule parts in the order they appear in\nthe value. The leftmost label …\n"],["parts","PublicSuffix::Rule::Normal","PublicSuffix/Rule/Normal.html#method-i-parts","()","<p>dot-split rule value and returns all rule parts in the order they appear in\nthe value.\n<p>@return [Array&lt;String&gt;] …\n"],["parts","PublicSuffix::Rule::Wildcard","PublicSuffix/Rule/Wildcard.html#method-i-parts","()","<p>dot-split rule value and returns all rule parts in the order they appear in\nthe value.\n<p>@return [Array&lt;String&gt;] …\n"],["rule","PublicSuffix::Rule::Exception","PublicSuffix/Rule/Exception.html#method-i-rule","()","<p>Gets the original rule definition.\n<p>@return [String] The rule definition.\n"],["rule","PublicSuffix::Rule::Normal","PublicSuffix/Rule/Normal.html#method-i-rule","()","<p>Gets the original rule definition.\n<p>@return [String] The rule definition.\n"],["rule","PublicSuffix::Rule::Wildcard","PublicSuffix/Rule/Wildcard.html#method-i-rule","()","<p>Gets the original rule definition.\n<p>@return [String] The rule definition.\n"],["rule_to_entry","PublicSuffix::List","PublicSuffix/List.html#method-i-rule_to_entry","(rule)",""],["select","PublicSuffix::List","PublicSuffix/List.html#method-i-select","(name, ignore_private: false)","<p>Selects all the rules matching given hostame.\n<p>If `ignore_private` is set to true, the algorithm will skip …\n"],["size","PublicSuffix::List","PublicSuffix/List.html#method-i-size","()","<p>Gets the number of rules in the list.\n<p>@return [Integer]\n"],["subdomain","PublicSuffix::Domain","PublicSuffix/Domain.html#method-i-subdomain","()","<p>Returns a subdomain-like representation of this object if the object is a\n{#subdomain?}, <code>nil</code> otherwise. …\n"],["subdomain?","PublicSuffix::Domain","PublicSuffix/Domain.html#method-i-subdomain-3F","()","<p>Checks whether <code>self</code> looks like a subdomain.\n<p>This method doesn&#39;t actually validate the subdomain.  …\n"],["to_a","PublicSuffix::Domain","PublicSuffix/Domain.html#method-i-to_a","()","<p>Returns an array containing the domain parts.\n<p>@return [Array&lt;String, nil&gt;]\n<p>@example\n"],["to_s","PublicSuffix::Domain","PublicSuffix/Domain.html#method-i-to_s","()","<p>Returns a string representation of this object.\n<p>@return [String]\n"],["valid?","PublicSuffix","PublicSuffix.html#method-c-valid-3F","(name, list: List.default, default_rule: list.default_rule, ignore_private: false)","<p>Checks whether <code>domain</code> is assigned and allowed, without\nactually parsing it.\n<p>This method doesn&#39;t care …\n"],["LICENSE","","LICENSE_txt.html","","<p>Copyright © 2009-2017 Simone Carletti &lt;weppos@weppos.net&gt;\n<p>MIT License\n<p>Permission is hereby granted, …\n"]]}}