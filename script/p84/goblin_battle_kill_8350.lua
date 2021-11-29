-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 158.560791 , 128.972107 , 15.565222 , 9.199999 , [[Camera:ScriptSplineLookAtPosition(163.000,128.700,10);]] )
   Camera:MotionSpline_AddSplinePoint( 158.560791 , 128.972107 , 15.565222 , 6.099997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 158.560791 , 128.972107 , 15.565222 , 9.099998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 158.560776 , 128.971939 , 15.565222 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
