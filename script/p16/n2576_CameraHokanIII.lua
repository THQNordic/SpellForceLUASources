-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 549.439026 , 575.059509 , 61.629765 , 24.700058 , [[Camera:ScriptSplineLookAtNpc(2576);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 551.346313 , 575.814087 , 60.689758 , 13.600016 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 552.696899 , 576.249573 , 60.689758 , 24.600058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 552.956909 , 577.394897 , 59.959759 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
