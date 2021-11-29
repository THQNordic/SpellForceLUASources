-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 317.147430 , 391.548859 , 15.344501 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9250);

Camera:ScriptSplineLookAtPosition(289.842,404.876,16.805);]] )
   Camera:MotionSpline_AddSplinePoint( 316.420044 , 392.895996 , 15.344501 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 316.420044 , 392.895996 , 15.344501 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 316.420044 , 392.895996 , 15.344501 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 6.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
