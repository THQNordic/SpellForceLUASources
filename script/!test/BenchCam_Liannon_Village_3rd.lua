-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 189.687897 , 68.620682 , 15.219106 , 24.900059 , [[Camera:ScriptSplineLookAtSpline();]] )
   Camera:MotionSpline_AddSplinePoint( 182.394897 , 71.261681 , 14.698955 , 2.600000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 174.765671 , 74.897346 , 14.239104 , 4.299998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 165.371811 , 77.471115 , 13.747724 , 5.799997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 157.188568 , 81.837868 , 12.939103 , 7.199996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 150.852249 , 86.746101 , 12.179105 , 8.799997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 145.952789 , 95.031799 , 11.359109 , 10.700005 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 147.878387 , 106.308662 , 10.307738 , 12.800013 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 155.169174 , 116.225212 , 9.209576 , 14.300018 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 162.796432 , 120.533432 , 8.659104 , 16.000025 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 173.398407 , 119.888351 , 8.549157 , 18.000032 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 185.008926 , 117.569824 , 8.639209 , 19.900040 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 196.540405 , 117.327087 , 8.289237 , 21.700047 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 204.768250 , 123.663704 , 8.089105 , 23.300053 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 211.084457 , 131.266983 , 7.957721 , 24.800058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 215.577896 , 139.363083 , 8.139104 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.585938 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
