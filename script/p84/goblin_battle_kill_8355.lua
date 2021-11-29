-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 166.430222 , 130.014160 , 11.901940 , 9.299999 , [[Camera:ScriptSplineLookAtPosition(156.000,129.500,8.600);]] )
   Camera:MotionSpline_AddSplinePoint( 166.430222 , 130.014160 , 11.901940 , 6.099997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 166.430222 , 130.014160 , 11.901940 , 9.199999 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 166.430222 , 130.014160 , 11.901940 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
