-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 243.443771 , 473.700073 , 72.449692 , 14.900021 , [[Camera:ScriptSplineLookAtNpc(6758);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.1);]] )
   Camera:MotionSpline_AddSplinePoint( 243.314880 , 477.890869 , 72.449692 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 243.174408 , 482.075409 , 72.439690 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 243.035706 , 486.269989 , 72.409691 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
