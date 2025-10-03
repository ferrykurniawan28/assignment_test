import 'package:assignment_test/core/style/theme.dart';
import 'package:assignment_test/features/portofoliio/data/model.dart';
import 'package:assignment_test/features/portofoliio/presentation/cubit/portofolio_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortofolioPage extends StatefulWidget {
  const PortofolioPage({super.key});

  @override
  State<PortofolioPage> createState() => _PortofolioPageState();
}

class _PortofolioPageState extends State<PortofolioPage> {
  int _currentIndex = 0;
  List<String> tabs = ['Project', 'Saved', 'Shared', 'Achievment'];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    context.read<PortofolioCubit>().loadPortofolio();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildPortfolioList(List<PortofolioModel> portfolios) {
    return Column(
      children: List.generate(
        portfolios.length,
        (index) => Container(
          height: 110.h,
          margin: EdgeInsets.only(bottom: 16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppTheme.unselectedColor, width: 1.w),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r),
                ),
                child: Image(
                  image: AssetImage(portfolios[index].imagePath),
                  width: 110.w,
                  height: 110.h,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        portfolios[index].title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          height: 18 / 14,
                          letterSpacing: 0,
                          color: const Color(0xFF303030),
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  portfolios[index].description,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: const Color(0xFF303030),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 2,
                                ),
                                2.verticalSpace,
                                RichText(
                                  text: TextSpan(
                                    text: 'Oleh ',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: const Color(0xFF9E95A2),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: portfolios[index].createdBy,
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF9E95A2),
                                        ),
                                      ),
                                    ],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                          8.horizontalSpace,
                          Container(
                            width: 50.w,
                            height: 26.h,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFF39519), Color(0xFFFFCD67)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Center(
                              child: Text(
                                portfolios[index].grade,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          'Portofolio',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xFF303030),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/icons/shopping-bag.png',
              width: 24.w,
              height: 24.h,
            ),
          ),
          16.horizontalSpace,
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/icons/notifications.png',
              width: 24.w,
              height: 24.h,
            ),
          ),
          16.horizontalSpace,
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    tabs.length,
                    (index) => Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: Text(
                            tabs[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: _currentIndex == index
                                  ? AppTheme.primaryColor
                                  : Color(0XFF303030),
                              fontWeight: _currentIndex == index
                                  ? FontWeight.w500
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 2.h,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        left: (_currentIndex * (1.sw / tabs.length)),
                        child: Container(
                          height: 2.h,
                          width: 1.sw / tabs.length,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _currentIndex == 0
                ? ListView(
                    padding: EdgeInsets.all(16.w),
                    children: [
                      SizedBox(
                        height: 44.h,
                        child: TextFormField(
                          controller: _searchController,
                          onChanged: (value) {
                            setState(() {}); // Rebuild to update suffix icon
                            context.read<PortofolioCubit>().searchPortofolio(
                              value,
                            );
                          },
                          decoration: InputDecoration(
                            hintText: 'Search a project',
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                color: AppTheme.unselectedColor,
                                width: 1.w,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                color: AppTheme.primaryColor,
                                width: 2.w,
                              ),
                            ),
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (_searchController.text.isNotEmpty)
                                  GestureDetector(
                                    onTap: () {
                                      _searchController.clear();
                                      setState(() {}); // Rebuild to update UI
                                      context
                                          .read<PortofolioCubit>()
                                          .loadPortofolio();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(8.w),
                                      child: Icon(
                                        Icons.clear,
                                        size: 20.w,
                                        color: AppTheme.unselectedColor,
                                      ),
                                    ),
                                  ),
                                GestureDetector(
                                  onTap: () {
                                    if (_searchController.text.isNotEmpty) {
                                      context
                                          .read<PortofolioCubit>()
                                          .searchPortofolio(
                                            _searchController.text,
                                          );
                                    }
                                  },
                                  child: Container(
                                    height: 28.h,
                                    width: 28.w,
                                    padding: EdgeInsets.all(4.w),
                                    margin: EdgeInsets.all(8.w),
                                    decoration: BoxDecoration(
                                      color: AppTheme.primaryColor,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Icon(
                                      Icons.search,
                                      size: 16.w,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      16.verticalSpace,

                      BlocBuilder<PortofolioCubit, PortofolioState>(
                        builder: (context, state) {
                          if (state is PortofolioLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is PortofolioLoaded) {
                            final portofolios = state.items;
                            return _buildPortfolioList(portofolios);
                          } else if (state is PortofolioSearch) {
                            final searchResults = state.results;
                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                  child: Text(
                                    'Found ${searchResults.length} result(s)',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppTheme.textSecondaryColor,
                                    ),
                                  ),
                                ),
                                _buildPortfolioList(searchResults),
                              ],
                            );
                          } else if (state is PortofolioEmpty) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.search_off,
                                    size: 64.w,
                                    color: AppTheme.unselectedColor,
                                  ),
                                  16.verticalSpace,
                                  Text(
                                    'No results found',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppTheme.textPrimaryColor,
                                    ),
                                  ),
                                  8.verticalSpace,
                                  Text(
                                    'Try searching with different keywords',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppTheme.textSecondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else if (state is PortofolioError) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    size: 64.w,
                                    color: AppTheme.errorColor,
                                  ),
                                  16.verticalSpace,
                                  Text(
                                    state.message,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: AppTheme.errorColor,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      80.verticalSpace, // Space for FAB
                    ],
                  )
                : Center(
                    child: Text(
                      'Content for "${tabs[_currentIndex]}" tab',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {},
        label: const Text('Filter'),
        icon: const Icon(Icons.filter_list),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          backgroundColor: AppTheme.primaryColor,
        ),
      ),
    );
  }
}
