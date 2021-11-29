-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 279.866516 , 373.556702 , 23.156403 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(304.148,421.051,9.000);]] )
   Camera:MotionSpline_AddSplinePoint( 283.604492 , 389.327881 , 23.156403 , 7.499995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 290.585968 , 399.501709 , 21.156406 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 295.295837 , 405.784027 , 13.176403 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
