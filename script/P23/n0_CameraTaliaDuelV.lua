-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 617.910889 , 282.524353 , 30.863600 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(3736);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 617.924561 , 283.850769 , 30.863600 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 617.921204 , 284.503998 , 30.873598 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 617.599304 , 285.500305 , 30.873598 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
