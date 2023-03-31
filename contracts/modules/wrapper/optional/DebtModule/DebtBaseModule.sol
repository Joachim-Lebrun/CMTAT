//SPDX-License-Identifier: MPL-2.0

pragma solidity ^0.8.17;

import "../../../../../openzeppelin-contracts-upgradeable/contracts/access/AccessControlUpgradeable.sol";
import "../../../../../openzeppelin-contracts-upgradeable/contracts/proxy/utils/Initializable.sol";
import "../../../../interfaces/IDebtGlobal.sol";
import "../../../security/AuthorizationModule.sol";

abstract contract DebtBaseModule is
    IDebtGlobal,
    Initializable,
    ContextUpgradeable,
    AuthorizationModule
{
    DebtBase public debt;

    /* Events */
    event InterestRate(uint256 indexed newInterestRate);
    event ParValue(uint256 indexed newParValue);
    event Guarantor(string indexed newGuarantorIndexed, string newGuarantor);
    event BondHolder(
        string indexed newBondHolderIndexed,
        string newBondHolder
    );
    event MaturityDate(
        string indexed newMaturityDateIndexed,
        string newMaturityDate
    );
    event InterestScheduleFormat(
        string indexed newInterestScheduleFormatIndexed,
        string newInterestScheduleFormat
    );
    event InterestPaymentDate(
        string indexed newInterestPaymentDateIndexed,
        string newInterestPaymentDate
    );
    event DayCountConvention(
        string indexed newDayCountConventionIndexed,
        string newDayCountConvention
    );
    event BusinessDayConvention(
        string indexed newBusinessDayConventionIndexed,
        string newBusinessDayConvention
    );
    event PublicHolidaysCalendar(
        string indexed newPublicHolidaysCalendarIndexed,
        string newPublicHolidaysCalendar
    );
    event IssuanceDate(
        string indexed newIssuanceDateIndexed,
        string newIssuanceDate
    );
    event CouponFrequency(
        string indexed newCouponFrequencyIndexed,
        string newCouponFrequency
    );

    function __DebtBaseModule_init(address admin) internal onlyInitializing {
        /* OpenZeppelin */
        __Context_init_unchained();

        // AccessControlUpgradeable inherits from ERC165Upgradeable
        __ERC165_init_unchained();
        // AuthorizationModule inherits from AccessControlUpgradeable
        __AccessControl_init_unchained();

        /* CMTAT modules */
        // Security
        __AuthorizationModule_init_unchained(admin);

        // own function
        __DebtBaseModule_init_unchained();
    }

    function __DebtBaseModule_init_unchained() internal onlyInitializing {
        // no variable to initialize
    }

    function setDebt(
        uint256 interestRate_,
        uint256 parValue_,
        string memory guarantor_,
        string memory bondHolder_,
        string memory maturityDate_,
        string memory interestScheduleFormat_,
        string memory interestPaymentDate_,
        string memory dayCountConvention_,
        string memory businessDayConvention_,
        string memory publicHolidayCalendar_,
        string memory issuanceDate_,
        string memory couponFrequency_
    ) public onlyRole(DEBT_ROLE) {
        // setGuarantor
        debt = (
            DebtBase(
                interestRate_,
                parValue_,
                guarantor_,
                bondHolder_,
                maturityDate_,
                interestScheduleFormat_,
                interestPaymentDate_,
                dayCountConvention_,
                businessDayConvention_,
                publicHolidayCalendar_,
                issuanceDate_,
                couponFrequency_
            )
        );
        emit InterestRate(interestRate_);
        emit ParValue(parValue_);
        emit Guarantor(guarantor_, guarantor_);
        emit BondHolder(bondHolder_, bondHolder_);
        emit MaturityDate(maturityDate_, maturityDate_);
        emit InterestScheduleFormat(
            interestScheduleFormat_,
            interestScheduleFormat_
        );
        emit InterestPaymentDate(interestPaymentDate_, interestPaymentDate_);
        emit DayCountConvention(dayCountConvention_, dayCountConvention_);
        emit BusinessDayConvention(
            businessDayConvention_,
            businessDayConvention_
        );
        emit PublicHolidaysCalendar(
            publicHolidayCalendar_,
            publicHolidayCalendar_
        );
    }

    function setInterestRate(uint256 interestRate_) public onlyRole(DEBT_ROLE) {
        debt.interestRate = interestRate_;
        emit InterestRate(interestRate_);
    }

    function setParValue(uint256 parValue_) public onlyRole(DEBT_ROLE) {
        debt.parValue = parValue_;
        emit ParValue(parValue_);
    }

    function setGuarantor(string memory guarantor_) public onlyRole(DEBT_ROLE) {
        debt.guarantor = guarantor_;
        emit Guarantor(guarantor_, guarantor_);
    }

    function setBondHolder(
        string memory bondHolder_
    ) public onlyRole(DEBT_ROLE) {
        debt.bondHolder = bondHolder_;
        emit BondHolder(bondHolder_, bondHolder_);
    }

    function setMaturityDate(
        string memory maturityDate_
    ) public onlyRole(DEBT_ROLE) {
        debt.maturityDate = maturityDate_;
        emit MaturityDate(maturityDate_, maturityDate_);
    }

    function setInterestScheduleFormat(
        string memory interestScheduleFormat_
    ) public onlyRole(DEBT_ROLE) {
        debt.interestScheduleFormat = interestScheduleFormat_;
        emit InterestScheduleFormat(
            interestScheduleFormat_,
            interestScheduleFormat_
        );
    }

    function setInterestPaymentDate(
        string memory interestPaymentDate_
    ) public onlyRole(DEBT_ROLE) {
        debt.interestPaymentDate = interestPaymentDate_;
        emit InterestPaymentDate(interestPaymentDate_, interestPaymentDate_);
    }

    function setDayCountConvention(
        string memory dayCountConvention_
    ) public onlyRole(DEBT_ROLE) {
        debt.dayCountConvention = dayCountConvention_;
        emit DayCountConvention(dayCountConvention_, dayCountConvention_);
    }

    function setBusinessDayConvention(
        string memory businessDayConvention_
    ) public onlyRole(DEBT_ROLE) {
        debt.businessDayConvention = businessDayConvention_;
        emit BusinessDayConvention(
            businessDayConvention_,
            businessDayConvention_
        );
    }

    function setPublicHolidaysCalendar(
        string memory publicHolidayCalendar_
    ) public onlyRole(DEBT_ROLE) {
        debt.publicHolidayCalendar = publicHolidayCalendar_;
        emit PublicHolidaysCalendar(
            publicHolidayCalendar_,
            publicHolidayCalendar_
        );
    }

    function setIssuanceDate(
        string memory issuanceDate_
    ) public onlyRole(DEBT_ROLE) {
        debt.issuanceDate = issuanceDate_;
        emit IssuanceDate(issuanceDate_, issuanceDate_);
    }

    function setCouponFrequency(
        string memory couponFrequency_
    ) public onlyRole(DEBT_ROLE) {
        debt.couponFrequency = couponFrequency_;
        emit CouponFrequency(couponFrequency_, couponFrequency_);
    }

    uint256[50] private __gap;
}
