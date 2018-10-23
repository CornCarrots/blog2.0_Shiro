package com.lh.bean;

import java.util.ArrayList;
import java.util.List;

public class ModuleExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ModuleExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andModuleNameIsNull() {
            addCriterion("module_name is null");
            return (Criteria) this;
        }

        public Criteria andModuleNameIsNotNull() {
            addCriterion("module_name is not null");
            return (Criteria) this;
        }

        public Criteria andModuleNameEqualTo(String value) {
            addCriterion("module_name =", value, "moduleName");
            return (Criteria) this;
        }

        public Criteria andModuleNameNotEqualTo(String value) {
            addCriterion("module_name <>", value, "moduleName");
            return (Criteria) this;
        }

        public Criteria andModuleNameGreaterThan(String value) {
            addCriterion("module_name >", value, "moduleName");
            return (Criteria) this;
        }

        public Criteria andModuleNameGreaterThanOrEqualTo(String value) {
            addCriterion("module_name >=", value, "moduleName");
            return (Criteria) this;
        }

        public Criteria andModuleNameLessThan(String value) {
            addCriterion("module_name <", value, "moduleName");
            return (Criteria) this;
        }

        public Criteria andModuleNameLessThanOrEqualTo(String value) {
            addCriterion("module_name <=", value, "moduleName");
            return (Criteria) this;
        }

        public Criteria andModuleNameLike(String value) {
            addCriterion("module_name like", value, "moduleName");
            return (Criteria) this;
        }

        public Criteria andModuleNameNotLike(String value) {
            addCriterion("module_name not like", value, "moduleName");
            return (Criteria) this;
        }

        public Criteria andModuleNameIn(List<String> values) {
            addCriterion("module_name in", values, "moduleName");
            return (Criteria) this;
        }

        public Criteria andModuleNameNotIn(List<String> values) {
            addCriterion("module_name not in", values, "moduleName");
            return (Criteria) this;
        }

        public Criteria andModuleNameBetween(String value1, String value2) {
            addCriterion("module_name between", value1, value2, "moduleName");
            return (Criteria) this;
        }

        public Criteria andModuleNameNotBetween(String value1, String value2) {
            addCriterion("module_name not between", value1, value2, "moduleName");
            return (Criteria) this;
        }

        public Criteria andModuleDescIsNull() {
            addCriterion("module_desc is null");
            return (Criteria) this;
        }

        public Criteria andModuleDescIsNotNull() {
            addCriterion("module_desc is not null");
            return (Criteria) this;
        }

        public Criteria andModuleDescEqualTo(String value) {
            addCriterion("module_desc =", value, "moduleDesc");
            return (Criteria) this;
        }

        public Criteria andModuleDescNotEqualTo(String value) {
            addCriterion("module_desc <>", value, "moduleDesc");
            return (Criteria) this;
        }

        public Criteria andModuleDescGreaterThan(String value) {
            addCriterion("module_desc >", value, "moduleDesc");
            return (Criteria) this;
        }

        public Criteria andModuleDescGreaterThanOrEqualTo(String value) {
            addCriterion("module_desc >=", value, "moduleDesc");
            return (Criteria) this;
        }

        public Criteria andModuleDescLessThan(String value) {
            addCriterion("module_desc <", value, "moduleDesc");
            return (Criteria) this;
        }

        public Criteria andModuleDescLessThanOrEqualTo(String value) {
            addCriterion("module_desc <=", value, "moduleDesc");
            return (Criteria) this;
        }

        public Criteria andModuleDescLike(String value) {
            addCriterion("module_desc like", value, "moduleDesc");
            return (Criteria) this;
        }

        public Criteria andModuleDescNotLike(String value) {
            addCriterion("module_desc not like", value, "moduleDesc");
            return (Criteria) this;
        }

        public Criteria andModuleDescIn(List<String> values) {
            addCriterion("module_desc in", values, "moduleDesc");
            return (Criteria) this;
        }

        public Criteria andModuleDescNotIn(List<String> values) {
            addCriterion("module_desc not in", values, "moduleDesc");
            return (Criteria) this;
        }

        public Criteria andModuleDescBetween(String value1, String value2) {
            addCriterion("module_desc between", value1, value2, "moduleDesc");
            return (Criteria) this;
        }

        public Criteria andModuleDescNotBetween(String value1, String value2) {
            addCriterion("module_desc not between", value1, value2, "moduleDesc");
            return (Criteria) this;
        }

        public Criteria andModulePidIsNull() {
            addCriterion("module_pid is null");
            return (Criteria) this;
        }

        public Criteria andModulePidIsNotNull() {
            addCriterion("module_pid is not null");
            return (Criteria) this;
        }

        public Criteria andModulePidEqualTo(Integer value) {
            addCriterion("module_pid =", value, "modulePid");
            return (Criteria) this;
        }

        public Criteria andModulePidNotEqualTo(Integer value) {
            addCriterion("module_pid <>", value, "modulePid");
            return (Criteria) this;
        }

        public Criteria andModulePidGreaterThan(Integer value) {
            addCriterion("module_pid >", value, "modulePid");
            return (Criteria) this;
        }

        public Criteria andModulePidGreaterThanOrEqualTo(Integer value) {
            addCriterion("module_pid >=", value, "modulePid");
            return (Criteria) this;
        }

        public Criteria andModulePidLessThan(Integer value) {
            addCriterion("module_pid <", value, "modulePid");
            return (Criteria) this;
        }

        public Criteria andModulePidLessThanOrEqualTo(Integer value) {
            addCriterion("module_pid <=", value, "modulePid");
            return (Criteria) this;
        }

        public Criteria andModulePidIn(List<Integer> values) {
            addCriterion("module_pid in", values, "modulePid");
            return (Criteria) this;
        }

        public Criteria andModulePidNotIn(List<Integer> values) {
            addCriterion("module_pid not in", values, "modulePid");
            return (Criteria) this;
        }

        public Criteria andModulePidBetween(Integer value1, Integer value2) {
            addCriterion("module_pid between", value1, value2, "modulePid");
            return (Criteria) this;
        }

        public Criteria andModulePidNotBetween(Integer value1, Integer value2) {
            addCriterion("module_pid not between", value1, value2, "modulePid");
            return (Criteria) this;
        }

        public Criteria andModuleUrlIsNull() {
            addCriterion("module_url is null");
            return (Criteria) this;
        }

        public Criteria andModuleUrlIsNotNull() {
            addCriterion("module_url is not null");
            return (Criteria) this;
        }

        public Criteria andModuleUrlEqualTo(String value) {
            addCriterion("module_url =", value, "moduleUrl");
            return (Criteria) this;
        }

        public Criteria andModuleUrlNotEqualTo(String value) {
            addCriterion("module_url <>", value, "moduleUrl");
            return (Criteria) this;
        }

        public Criteria andModuleUrlGreaterThan(String value) {
            addCriterion("module_url >", value, "moduleUrl");
            return (Criteria) this;
        }

        public Criteria andModuleUrlGreaterThanOrEqualTo(String value) {
            addCriterion("module_url >=", value, "moduleUrl");
            return (Criteria) this;
        }

        public Criteria andModuleUrlLessThan(String value) {
            addCriterion("module_url <", value, "moduleUrl");
            return (Criteria) this;
        }

        public Criteria andModuleUrlLessThanOrEqualTo(String value) {
            addCriterion("module_url <=", value, "moduleUrl");
            return (Criteria) this;
        }

        public Criteria andModuleUrlLike(String value) {
            addCriterion("module_url like", value, "moduleUrl");
            return (Criteria) this;
        }

        public Criteria andModuleUrlNotLike(String value) {
            addCriterion("module_url not like", value, "moduleUrl");
            return (Criteria) this;
        }

        public Criteria andModuleUrlIn(List<String> values) {
            addCriterion("module_url in", values, "moduleUrl");
            return (Criteria) this;
        }

        public Criteria andModuleUrlNotIn(List<String> values) {
            addCriterion("module_url not in", values, "moduleUrl");
            return (Criteria) this;
        }

        public Criteria andModuleUrlBetween(String value1, String value2) {
            addCriterion("module_url between", value1, value2, "moduleUrl");
            return (Criteria) this;
        }

        public Criteria andModuleUrlNotBetween(String value1, String value2) {
            addCriterion("module_url not between", value1, value2, "moduleUrl");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}